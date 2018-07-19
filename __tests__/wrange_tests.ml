open Jest

let make_birthday = Person.birthday_of_string_exn

let make_person ?(last_name = "Wittig") ?(first_name = "Kachel")
      ?(gender = `Female) ?(favourite_colour = `Yellow)
      ?(birthday = make_birthday "1989-01-25") () =
   Person.create ~last_name ~first_name ~gender ~favourite_colour ~birthday

let _ =
describe "Data model" begin fun ()->
   describe "Person" begin fun ()->
      test "can be created" Expect.(fun ()->
         expect (fun _ ->
            Person.create ~first_name:"Kachel" ~last_name:"Wittig" ~gender:`Female
               ~favourite_colour:`Yellow ~birthday:(make_birthday "1989-01-25") |> ignore
         ) |> not_ |> toThrow
      );

      test "can produce a string for their birthday" Expect.(fun ()->
         let person = make_person ~birthday:(make_birthday "1989-01-25") () in
         expect (Person.string_of_birthday person) |> (toBe "1989-01-25")
      );

      test "can parse a date-string as a convenience" Expect.(fun ()->
         expect (fun _ ->
            Person.birthday_of_string_exn "1989-01-25"
         ) |> not_ |> toThrow
      );

      test "round-trips a string-ish birthday" Expect.(fun ()->
         let str = "1989-01-25" in
         let date = Person.birthday_of_string_exn str in
         let person = make_person ~birthday:date () in
         expect (Person.string_of_birthday person) |> (toBe str)
      );

      test "throws on a non-date birthday" Expect.(fun ()->
         expect (fun _ ->
            Person.birthday_of_string_exn "this is not a birthday"
         ) |> toThrow
      );

      describe "Record validation" begin fun ()->
         test "accepts a well-formed description" Expect.(fun ()->
            expect (fun _ ->
               Person.of_string_description ~last_name:"Wittig" ~first_name:"Kachel"
                  ~gender:"Female" ~favourite_colour:"Yellow" ~birthday:"1989-01-25"
            ) |> not_ |> toThrow
         );

         test "accepts mis-cased variant tags" Expect.(fun ()->
            let (p:Person.t) = Person.of_string_description ~last_name:"Wittig" ~first_name:"Kachel"
               ~gender:"feMAlE" ~favourite_colour:"yElLOW" ~birthday:"1989-01-25" in
            expect (p.last_name, p.first_name,
               p.gender, p.favourite_colour, Person.string_of_birthday p)
            |> toEqual ("Wittig", "Kachel", `Female, `Yellow, "1989-01-25")
         );
      end;

      describe "Set of people" begin fun ()->
         test "can be created, empty" Expect.(fun ()->
            expect (fun _ ->
               Person.set_create ()
            ) |> not_ |> toThrow
         );

         test "can be added to" Expect.(fun ()->
            let set = Person.set_create () in
            let person = make_person () in
            expect (fun _ ->
               Person.set_add set person
            ) |> not_ |> toThrow
         );

         test "can be retrieved from" Expect.(fun ()->
            let set = Person.set_create () in
            let person = make_person () in
            Person.set_add set person;
            let result = Person.set_find_exn set person.last_name person.first_name
               (Person.string_of_birthday person) in
            expect result |> (toBe person)
         );

         test "retrieves the correct person, even with an overloaded name" Expect.(fun ()->
            let set = Person.set_create () in
            let a_person = make_person ~birthday:(make_birthday "1949-03-16") () in
            let another_person = make_person ~birthday:(make_birthday "1990-12-25") () in
            Person.set_add set a_person;
            Person.set_add set another_person;
            let result = Person.set_find_exn set a_person.last_name a_person.first_name
               (Person.string_of_birthday a_person) in
            expect result |> (toBe a_person)
         );

         test "can be folded into a array" Expect.(fun ()->
            let set = Person.set_create ()
            and a_person = make_person ~first_name:"Kelly" ()
            and another_person = make_person ~first_name:"Andy" () in
            Person.set_add set a_person;
            Person.set_add set another_person;
            let result = Person.array_of_set set ~sorts:[] in
            expect (Array.length result) |> (toBe 2)
         );

         test "can be sorted by name" Expect.(fun ()->
            let set = Person.set_create ()
            and a_person = make_person ~first_name:"Kelly" ()
            and another_person = make_person ~first_name:"Andy" ()
            and last_person = make_person ~first_name:"Ranger" () in
            Person.set_add set a_person;
            Person.set_add set another_person;
            Person.set_add set last_person;
            let result = Person.(array_of_set set ~sorts:[First, Ascending]) in
            expect (Array.map (fun (pers:Person.t) -> pers.first_name) result)
            |> (toEqual [|"Andy"; "Kelly"; "Ranger"|])
         );

         test "can be sorted in inverted order" Expect.(fun ()->
            let set = Person.set_create ()
            and a_person = make_person ~first_name:"Kelly" ()
            and another_person = make_person ~first_name:"Andy" ()
            and last_person = make_person ~first_name:"Ranger" () in
            Person.set_add set a_person;
            Person.set_add set another_person;
            Person.set_add set last_person;
            let result = Person.(array_of_set set ~sorts:[First, Descending]) in
            expect (Array.map (fun (pers:Person.t) -> pers.first_name) result)
            |> (toEqual [|"Ranger"; "Kelly"; "Andy"|])
         );

         test "accepts multiple keys to sort by, and ignores extraneous ones" Expect.(fun ()->
            let set = Person.set_create ()
            and a_person = make_person ~first_name:"Kelly" ()
            and another_person = make_person ~first_name:"Andy" ()
            and last_person = make_person ~first_name:"Ranger" () in
            Person.set_add set a_person;
            Person.set_add set another_person;
            Person.set_add set last_person;
            let result = Person.(array_of_set set ~sorts:[First, Ascending; Last, Ascending]) in
            expect (Array.map (fun (pers:Person.t) -> pers.first_name) result)
            |> (toEqual [|"Andy"; "Kelly"; "Ranger"|])
         );

         test "sorts lexicographically by secondary keys in the case of conflicts" Expect.(fun ()->
            let set = Person.set_create () in
            List.iter (Person.set_add set) [
               make_person ~first_name:"Kachel" ~last_name:"Wittig" ();
               make_person ~first_name:"Kelly" ~last_name:"Awesomedottir" ();
               make_person ~first_name:"Andy" ~last_name:"Awesomedottir" ();
               make_person ~first_name:"Ranger" ~last_name:"Awesomedottir" ();
            ];
            let result = Person.(array_of_set set ~sorts:[Last, Ascending; First, Ascending]) in
            expect (Array.map (fun (pers:Person.t) -> pers.first_name) result)
            |> (toEqual [|"Andy"; "Kelly"; "Ranger"; "Kachel"|])
         );
      end
   end
end;

describe "Parsing" begin fun ()->
   let parse = Wrange.parse_print_errors in

   test "handles an empty document" Expect.(fun ()->
      expect (fun _ ->
         parse ""
      ) |> not_ |> toThrow
   );

   test "returns an empty list for an empty document" Expect.(fun ()->
      expect (parse "") |> (toBe [])
   );

   test "recognizes a single record with a terminating newline" Expect.(fun ()->
      let results = parse "Wittig|Kachel|Female|Yellow|1989-01-25\n" in
      expect (List.length results) |> (toBe 1)
   );

   test "recognizes a single record with no terminator" Expect.(fun ()->
      let results = parse "Wittig|Kachel|Female|Yellow|1989-01-25" in
      expect (List.length results) |> (toBe 1)
   );

   (* test "handles a single record" Expect.(fun ()-> *)
   (*    let (result : Person.t) = parse "Wittig | Kachel | female | yellow | 1989-01-25" in *)
   (*    expect result |> (toEqual { *)
   (*       last_name = "Kachel"; *)
   (*       first_name = "Wittig"; *)
   (*       gender = `Female; *)
   (*       favourite_colour = `Yellow; *)
   (*       birthday = make_birthday "1989-01-25" *)
   (*    }) *)
   (* ); *)
end;
