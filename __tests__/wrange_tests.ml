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
               ~favourite_colour:Person.Yellow ~birthday:(make_birthday_exn "1989-01-25")
         ) |> not_ |> toThrow
      );

      test "can produce a string for their birthday" Expect.(fun ()->
         let person = make_person ~birthday:(make_birthday_exn "1989-01-25") () in
         expect (Person.string_of_birthday person) |> (toBe "1989-01-25")
      );
   end
end
