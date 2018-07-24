open Cmdliner

(* Remove Node's default first argument, to confirm to Cmdliner's expectations *)
[%%raw "process.argv.shift()"]


let hello () = print_endline "Hello, world!"

let hello_t = Term.(const hello $ const ())

let () = Term.exit @@ Term.eval (hello_t, Term.info "wrange")
