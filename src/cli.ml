open Cmdliner

(* Remove Node's default first argument, to confirm to Cmdliner's expectations *)
[%%raw
   "process.argv.shift()"]

let sprintf = Printf.sprintf

let sort_keys =
   [("last", `Last); ("first", `First); ("gender", `Gender); ("birthday", `Birthday)]


let sort_orders = [("ascending", `Ascending); ("descending", `Descending)]

let fields =
   let open Person in
   [ ("last_name", Last_name)
   ; ("first_name", First_name)
   ; ("gender", Gender)
   ; ("favourite_colour", Favourite_colour)
   ; ("birthday", Birthday) ]


let serve port files =
   let set = PersonSet.create () in
   files
   |> List.iter (fun file ->
            let more = PersonSet.of_file_exn file in
            PersonSet.add_all ~src:more ~dest:set ()) ;
   Server.start ~port set |> ignore


(* TODO: Provide a flag to control date-printing; at the moment, this tool can't even
   round-trip its own data — it accepts ISO dates, and prints American dates, as
   required. That should be toggleable. *)
(* TODO: Provide a flag to dump JSON; all the infrastructure is already there, just need
   to wire it up. *)
let print sep fields sorts files =
   let set = PersonSet.create () in
   files
   |> List.iter (fun file ->
            let more = PersonSet.of_file_exn file in
            PersonSet.add_all ~src:more ~dest:set ()) ;

   PersonSet.to_array set ~sorts
   |> Array.iter (fun person -> print_endline (Person.to_string ?sep ?fields person))


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


let serve' =
   let doc = "Start a REST server publishing given person-records" in
   (Term.(const serve $ port' $ files'), Term.info ~doc "serve")


let sep' =
   let doc =
      sprintf
         "Indicate a field-separator to print between selected fields. Defaults to %s"
         (Arg.doc_quote ", ")
   in
   Arg.(value & opt (some string) None & info ["separator"] ~docv:"SEP" ~doc)


let fields' =
   let open Arg in
   let field = enum fields in
   let field_doc = doc_alts_enum fields in
   let doc =
      sprintf
         "Select which fields to include in the sorted output. $(docv) must be a \
          comma-separated list of FIELDs, where each FIELD is %s or a unique prefix \
          thereof. Defaults to printing all fields. e.g. %s"
         field_doc
         (doc_quote "$(i,-f first,last)")
   in
   value & opt (some (list field)) None & info ["f"; "fields"] ~docv:"FIELDSPEC" ~doc


let sorts' =
   let open Arg in
   let sort_key = enum sort_keys in
   let sort_key_doc = doc_alts_enum sort_keys in
   let sort_order = enum sort_orders in
   let sort_order_doc = doc_alts_enum sort_orders in
   let doc =
      sprintf
         "Specify the single sorting constraint $(docv) to apply to the output. May be \
          specified more than once, in which case the sorts are applied \
          lexicographically, in corresponding order. The constraint $(docv) must be \
          specified as a comma-separated pair of %s; where $(b,KEY) is %s, and \
          $(b,ORDER) is %s. e.g. %s"
         (doc_quote "$(b,KEY,ORDER)") sort_key_doc sort_order_doc
         (doc_quote "$(i,--sort=birth,asc)")
   in
   value & opt_all (pair sort_key sort_order) [] & info ["sort"] ~docv:"SORTSPEC" ~doc


let print' =
   let doc = "Sort, and display, the contents of person-records stored in files" in
   (Term.(const print $ sep' $ fields' $ sorts' $ files'), Term.info ~doc "print")


let default' =
   let doc = "a person-record parser, sorter, and server" in
   let ret = `Help (`Pager, None) in
   let ret' = Term.const ret in
   (Term.ret ret', Term.info "wrange" ~version:"v0.0.1" ~doc)


let _ =
   let commands = [serve'; print'] in
   Term.eval_choice default' commands
