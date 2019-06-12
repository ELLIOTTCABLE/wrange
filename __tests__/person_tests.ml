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

         test "can be converted to JSON" Expect.(fun ()->
                  let person = make_person () in
                  expect (fun _ ->
                           Person.to_json person
                        ) |> not_ |> toThrow
               );

         test "round-trips through JSON" Expect.(fun ()->
                  let person = make_person () in
                  let json = Person.to_json person in
                  let clone = Person.of_json_exn json in
                  expect person |> (toEqual clone)
               );

         describe "Record validation" begin fun ()->
            test "accepts a well-formed description" Expect.(fun ()->
                     expect (fun _ ->
                              Person.of_string_description ~last_name:"Wittig" ~first_name:"Kachel"
                                 ~gender:"Female" ~favourite_colour:"Yellow" ~birthday:"1989-01-25"
                           ) |> not_ |> toThrow
                  );

            test "accepts mis-cased variant tags" Expect.(fun ()->
                     let p = Person.of_string_description ~last_name:"Wittig" ~first_name:"Kachel"
                           ~gender:"feMAlE" ~favourite_colour:"yElLOW" ~birthday:"1989-01-25" in
                     expect Person.(p.last_name, p.first_name, p.gender,
                                    p.favourite_colour, Person.string_of_birthday p)
                     |> toEqual ("Wittig", "Kachel", `Female, `Yellow, "1989-01-25")
                  );
         end;

         describe "Set of people" begin fun ()->
            test "can be created, empty" Expect.(fun ()->
                     expect (fun _ ->
                              PersonSet.create ()
                           ) |> not_ |> toThrow
                  );

            test "can be added to" Expect.(fun ()->
                     let set = PersonSet.create () in
                     let person = make_person () in
                     expect (fun _ ->
                              PersonSet.add set person
                           ) |> not_ |> toThrow
                  );

            test "can be retrieved from" Expect.(fun ()->
                     let set = PersonSet.create () in
                     let person = make_person () in
                     PersonSet.add set person;
                     let result = PersonSet.find_exn set person.last_name person.first_name
                           (Person.string_of_birthday person) in
                     expect result |> (toBe person)
                  );

            test "retrieves the correct person, even with an overloaded name" Expect.(fun ()->
                     let set = PersonSet.create () in
                     let a_person = make_person ~birthday:(make_birthday "1949-03-16") () in
                     let another_person = make_person ~birthday:(make_birthday "1990-12-25") () in
                     PersonSet.add set a_person;
                     PersonSet.add set another_person;
                     let result = PersonSet.find_exn set a_person.last_name a_person.first_name
                           (Person.string_of_birthday a_person) in
                     expect result |> (toBe a_person)
                  );

            test "can be folded into a array" Expect.(fun ()->
                     let set = PersonSet.create ()
                     and a_person = make_person ~first_name:"Kelly" ()
                     and another_person = make_person ~first_name:"Andy" () in
                     PersonSet.add set a_person;
                     PersonSet.add set another_person;
                     let result = PersonSet.to_array set ~sorts:[] in
                     expect (Array.length result) |> (toBe 2)
                  );

            test "can be sorted by name" Expect.(fun ()->
                     let set = PersonSet.create ()
                     and a_person = make_person ~first_name:"Kelly" ()
                     and another_person = make_person ~first_name:"Andy" ()
                     and last_person = make_person ~first_name:"Ranger" () in
                     PersonSet.add set a_person;
                     PersonSet.add set another_person;
                     PersonSet.add set last_person;
                     let result = PersonSet.to_array set ~sorts:[`First, `Ascending] in
                     expect (Array.map Person.(fun p -> p.first_name) result)
                     |> (toEqual [|"Andy"; "Kelly"; "Ranger"|])
                  );

            test "can be sorted in inverted order" Expect.(fun ()->
                     let set = PersonSet.create ()
                     and a_person = make_person ~first_name:"Kelly" ()
                     and another_person = make_person ~first_name:"Andy" ()
                     and last_person = make_person ~first_name:"Ranger" () in
                     PersonSet.add set a_person;
                     PersonSet.add set another_person;
                     PersonSet.add set last_person;
                     let result = PersonSet.to_array set ~sorts:[`First, `Descending] in
                     expect (Array.map Person.(fun p -> p.first_name) result)
                     |> (toEqual [|"Ranger"; "Kelly"; "Andy"|])
                  );

            test "accepts multiple keys to sort by, and ignores extraneous ones" Expect.(fun ()->
                     let set = PersonSet.create ()
                     and a_person = make_person ~first_name:"Kelly" ()
                     and another_person = make_person ~first_name:"Andy" ()
                     and last_person = make_person ~first_name:"Ranger" () in
                     PersonSet.add set a_person;
                     PersonSet.add set another_person;
                     PersonSet.add set last_person;
                     let result = PersonSet.to_array set ~sorts:[`First, `Ascending; `Last, `Ascending] in
                     expect (Array.map Person.(fun p -> p.first_name) result)
                     |> (toEqual [|"Andy"; "Kelly"; "Ranger"|])
                  );

            test "sorts lexicographically by secondary keys in the case of conflicts" Expect.(fun ()->
                     let set = PersonSet.create () in
                     List.iter (PersonSet.add set) [
                        make_person ~first_name:"Kachel" ~last_name:"Wittig" ();
                        make_person ~first_name:"Kelly" ~last_name:"Awesomedottir" ();
                        make_person ~first_name:"Andy" ~last_name:"Awesomedottir" ();
                        make_person ~first_name:"Ranger" ~last_name:"Awesomedottir" ();
                     ];
                     let result = PersonSet.to_array set ~sorts:[`Last, `Ascending; `First, `Ascending] in
                     expect (Array.map Person.(fun p -> p.first_name) result)
                     |> (toEqual [|"Andy"; "Kelly"; "Ranger"; "Kachel"|])
                  );
         end
      end
   end;
