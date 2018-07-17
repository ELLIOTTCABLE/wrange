open Jest

let make_birthday_exn iso8601 =
   let date = Js.Date.fromString iso8601 in
   let flo = Js.Date.valueOf date in
   if not @@ Js.Float.isNaN flo
   then date
   else failwith "Unparsable date"


let _ =
describe "Data model" begin fun ()->
   describe "Person" begin fun ()->
      test "can be created" Expect.(fun ()->
         let person = Person.create ~first_name:"Kachel" ~last_name:"Wittig" ~gender:Person.Female
         ~favourite_colour:Person.Yellow ~birthday:(make_birthday_exn "1989-01-25") in
         expect (fun _-> person) |> not_ |> toThrow
      )
   end
end
