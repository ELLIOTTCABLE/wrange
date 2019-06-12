open Cmdliner

(* Remove Node's default first argument, to confirm to Cmdliner's expectations *)
[%%raw
   "process.argv.shift()"]

let sort_keys =
   [("last", `Last); ("first", `First); ("gender", `Gender); ("birthday", `Birthday)]


let sort_orders = [("ascending", `Ascending); ("descending", `Descending)]

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

let files' =
   let doc =
      "The path to a text-file containing a set of person-records, in a supported \
       format. (See $(b,FORMATS), below.) May be specified multiple times; the records \
       in later files will be merged into the set implied by earlier ones with \
       preference to later entries."
   in
   Arg.(non_empty & pos_all string [] & info [] ~docv:"FILE" ~doc)


(* TODO: Document FORMATS. *)

let port' =
   let doc = "Bind to connections on $(docv)." in
   Arg.(value & opt int 3000 & info ["p"; "port"] ~docv:"PORT" ~doc)


let sorts' =
   let open Arg in
   let sort_key = enum sort_keys in
   let sort_key_doc = doc_alts_enum sort_keys in
   let sort_order = enum sort_orders in
   let sort_order_doc = doc_alts_enum sort_orders in
   let doc =
      Printf.sprintf
         "Specify the single sorting constraint $(docv) to apply to the output. May be \
          specified more than once, in which case the sorts are applied \
          lexicographically, in corresponding order. The constraint $(docv) must be \
          specified as a comma-separated pair of %s; where $(b,KEY) is %s, and \
          $(b,ORDER) is %s."
         (doc_quote "$(b,KEY,ORDER)") sort_key_doc sort_order_doc
   in
   value & opt_all (pair sort_key sort_order) [] & info ["sort"] ~docv:"SORTSPEC" ~doc


let start' =
   let doc = "Start a REST server publishing given person-records" in
   (Term.(const start $ port' $ files'), Term.info ~doc "start")


let print' =
   let doc = "Sort, and display, the contents of person-records stored in files" in
   (Term.(const print $ sorts' $ files'), Term.info ~doc "print")


let default' =
   let doc = "a person-record parser and server" in
   let ret = `Help (`Pager, None) in
   let ret' = Term.const ret in
   (Term.ret ret', Term.info "wrange" ~version:"v0.0.1" ~doc)


let _ =
   let commands = [start'; print'] in
   Term.eval_choice default' commands
