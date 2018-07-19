open Jest

let _=
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

   (* FIXME *)
   Skip.test "recognizes a single record with prefixing whitespace" Expect.(fun ()->
      let results = parse "  Wittig|Kachel|Female|Yellow|1989-01-25" in
      expect (List.length results) |> (toBe 1)
   );

   test "recognizes a single record with whitespace preceding the EOF" Expect.(fun ()->
      let results = parse "Wittig|Kachel|Female|Yellow|1989-01-25  " in
      expect (List.length results) |> (toBe 1)
   );

   test "parses a single record, with spacing" Expect.(fun ()->
      match parse "Wittig | Kachel | female | yellow | 1989-01-25" with
      | result :: [] ->
      expect result |> (toEqual Person.({
         last_name = "Wittig";
         first_name = "Kachel";
         gender = `Female;
         favourite_colour = `Yellow;
         birthday = Person.birthday_of_string_exn "1989-01-25"
      }))
      | _ -> failwith "see previous test"
   );

   test "recognizes multiple spaced, terminated records" Expect.(fun ()->
      (* Lack of whitespace *before* the first record is currently important *)
      let doc = {js|Awesomedottir,  Kelly,   Female,  Yellow,  1989-01-01
                    Awesomedottir,  Andy,    Male,    Red,     1989-01-01
                    Awesomedottir,  Ranger,  Female,  Black,   2012-01-01
      |js} in
      let results = parse doc in
      expect (List.length results) |> (toBe 3)
   );

   test "parses multiple spaced, terminated records" Expect.(fun ()->
      (* Lack of whitespace *before* the first record is currently important *)
      let doc = {js|Awesomedottir,  Kelly,   Female,  Yellow,  1989-01-01
                    Awesomedottir,  Andy,    Male,    Red,     1989-01-01
                    Awesomedottir,  Ranger,  Female,  Black,   2012-01-01
      |js} in
      let results = parse doc in
      let results' = results |> List.map Person.(fun p -> p.first_name) in
      expect (results') |> (toEqual ["Ranger"; "Andy"; "Kelly"])
   );
end;
