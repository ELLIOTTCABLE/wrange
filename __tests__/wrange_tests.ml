open Jest

let make_birthday_exn iso8601 =
   let date = Js.Date.fromString iso8601 in
   let flo = Js.Date.valueOf date in
   if not @@ Js.Float.isNaN flo
   then date
   else failwith "Unparsable date"

let make_person ?(last_name = "Wittig") ?(first_name = "Kachel")
      ?(gender = Person.Female) ?(favourite_colour = Person.Yellow)
      ?(birthday = make_birthday_exn "1989-01-25") () =
   Person.create ~last_name ~first_name ~gender ~favourite_colour ~birthday

let _ =
describe "Data model" begin fun ()->
   describe "Person" begin fun ()->
      test "can be created" Expect.(fun ()->
         expect (fun _ ->
            Person.create ~first_name:"Kachel" ~last_name:"Wittig" ~gender:Person.Female
               ~favourite_colour:Person.Yellow ~birthday:(make_birthday_exn "1989-01-25") |> ignore
         ) |> not_ |> toThrow
      );

      test "can produce a string for their birthday" Expect.(fun ()->
         let person = make_person ~birthday:(make_birthday_exn "1989-01-25") () in
         expect (Person.string_of_birthday person) |> (toBe "1989-01-25")
      );

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
            let a_person = make_person ~birthday:(make_birthday_exn "1949-03-16") () in
            let another_person = make_person ~birthday:(make_birthday_exn "1990-12-25") () in
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
            expect (Array.map (fun (pers:Person.person) -> pers.first_name) result)
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
            expect (Array.map (fun (pers:Person.person) -> pers.first_name) result)
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
            expect (Array.map (fun (pers:Person.person) -> pers.first_name) result)
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
            expect (Array.map (fun (pers:Person.person) -> pers.first_name) result)
            |> (toEqual [|"Andy"; "Kelly"; "Ranger"; "Kachel"|])
         );
      end
   end
end
