open Jest

let _ =
describe "Data model" begin fun ()->
   test "Blah" Expect.(fun ()->
      expect (1 + 2) |> (toBe 3)
   )
end
