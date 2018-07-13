let rec fact = function
| 1 -> 1
| n -> n * fact (n - 1)

let () =
   print_int (fact 5)
