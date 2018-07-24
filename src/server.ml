open Express

let make_success value =
  let json = Js.Dict.empty () in
  Js.Dict.set json "status" (Js.Json.string "success");
  Js.Dict.set json "value" value;
  Js.Json.object_ json

let make_failure error =
  let json = Js.Dict.empty () in
  Js.Dict.set json "status" (Js.Json.string "failure");
  Js.Dict.set json "error" error;
  Js.Json.object_ json

let make_parsing_failure ?(msg="") lexbuf =
  let pos = Lexing.(lexbuf.lex_curr_p) in
  let loc = Printf.sprintf "%s:%d:%d" pos.pos_fname pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1) in
  let error = {j|Error parsing record:\n$loc - $msg|j} in
  make_failure (Js.Json.string error)

let (>>) f g x = x |> f |> g


let logRequest next req =
   let open Request in
   let ip' = ip req and meth = methodRaw req and url = path req
   and text = begin match bodyText req with
   | Some t -> String.concat "" [": \""; t; "\""]
   | None -> ""
   end in
   Js.log {j|$(ip') ~ $meth $(url)$text|j};
   next Next.middleware

let addPerson set _next req (* res *) =
   match Request.bodyText req with
   | None ->
         Response.status Response.StatusCode.BadRequest
      >> Response.sendJson (make_failure (Js.Json.string "Body required for POST /records"))
   | Some text ->
      let lexbuf = Lexing.from_string text in
      try begin
         let people = Wrange.parse_buf_exn lexbuf in
         let people' = Array.of_list people |> Array.map (fun person ->
            Person.set_add set person;
            Person.to_json person
         ) in
         Response.status Response.StatusCode.Created
         >> Response.sendJson @@ (make_success (Js.Json.array people'))
      end with
      | Lexer.SyntaxError msg ->
         Response.status Response.StatusCode.BadRequest
         >> Response.sendJson @@ make_parsing_failure ~msg lexbuf
      | Parser.Error ->
         Response.status Response.StatusCode.BadRequest
         >> Response.sendJson @@ make_parsing_failure lexbuf


let announce port err = match err with
  | exception Js.Exn.Error e -> Js.log e; Node.Process.exit 1
  | _ -> Js.log ("Listening at http://127.0.0.1:" ^ (string_of_int port))


let start ?(port=3000) (set : Person.set) =
   let api = Router.make () in

   Router.post api ~path:"/records" @@ Middleware.from (addPerson set);

   let app = App.make () in
   app |. App.use (Middleware.text ());
   app |. App.use (Middleware.from logRequest);
   app |. App.useRouterOnPath ~path:"/v1" api;
   app |. App.listen ~port ~onListen:(announce port) ()


let () =
   start (Person.set_create ()) |> ignore
