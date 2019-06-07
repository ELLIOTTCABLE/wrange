open Cmdliner

(* Remove Node's default first argument, to confirm to Cmdliner's expectations *)
[%%raw
   "process.argv.shift()"]

let hello () = print_endline "Hello, world!"

let start port files =
   let set = Person.set_create () in
   Server.start ~port set |> ignore


(* CLI declarations *)
let files' = Arg.(non_empty & pos_all string [] & info [] ~docv:"FILE")

let hello' = Term.(const hello $ const ())

let port' =
   let doc = "Provide a REST interface on $(docv)" in
   Arg.(value & opt int 3000 & info ["p"; "port"] ~docv:"PORT" ~doc)


let start' =
   let doc = "Start a REST server" in
   (Term.(const start $ port' $ files'), Term.info ~doc "start")


let print' =
   let doc = "Sort, and display, the contents of the given person-records" in
   (Term.(const hello $ const ()), Term.info ~doc "print")


let default' =
   let doc = "a person-record parser and server" in
   let ret = `Help (`Pager, None) in
   let ret' = Term.const ret in
   (Term.ret ret', Term.info "wrange" ~version:"v0.0.1" ~doc)


let _ =
   let commands = [start'; print'] in
   Term.eval_choice default' commands
