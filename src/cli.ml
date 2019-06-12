open Cmdliner

(* Remove Node's default first argument, to confirm to Cmdliner's expectations *)
[%%raw
   "process.argv.shift()"]

let start port files =
   let set = PersonSet.create () in
   files
   |> List.iter (fun file ->
            let more = PersonSet.of_file_exn file in
            PersonSet.add_all ~src:more ~dest:set ()) ;
   Server.start ~port set |> ignore


let print sorts files =
   let set = PersonSet.create () in
   files
   |> List.iter (fun file ->
            let more = PersonSet.of_file_exn file in
            PersonSet.add_all ~src:more ~dest:set ()) ;

   let people = PersonSet.to_array set ~sorts in
   people |> Array.iter (fun person -> Js.log (Person.to_json person))


(* CLI declarations *)
let sort_key : Person.sort_key Arg.conv =
   Arg.enum
      [("last", `Last); ("first", `First); ("gender", `Gender); ("birthday", `Birthday)]


let sort_order : Person.sort_order Arg.conv =
   Arg.enum [("ascending", `Ascending); ("descending", `Descending)]


let files' = Arg.(non_empty & pos_all string [] & info [] ~docv:"FILE")

let port' =
   let doc = "Provide a REST interface on $(docv)" in
   Arg.(value & opt int 3000 & info ["p"; "port"] ~docv:"PORT" ~doc)


let sorts' =
   let doc = "DOCME" in
   let open Arg in
   value & opt_all (pair sort_key sort_order) [] & info ["sort"] ~docv:"SORTSPEC" ~doc


let start' =
   let doc = "Start a REST server" in
   (Term.(const start $ port' $ files'), Term.info ~doc "start")


let print' =
   let doc = "Sort, and display, the contents of the given person-records" in
   (Term.(const print $ sorts' $ files'), Term.info ~doc "print")


let default' =
   let doc = "a person-record parser and server" in
   let ret = `Help (`Pager, None) in
   let ret' = Term.const ret in
   (Term.ret ret', Term.info "wrange" ~version:"v0.0.1" ~doc)


let _ =
   let commands = [start'; print'] in
   Term.eval_choice default' commands
