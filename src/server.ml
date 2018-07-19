open Express

let make_success () =
  let json = Js.Dict.empty () in
  Js.Dict.set json "status" (Js.Json.string "success"); Js.Json.object_ json

let make_failure () =
  let json = Js.Dict.empty () in
  Js.Dict.set json "status" (Js.Json.string "failure"); Js.Json.object_ json

let make_parsing_failure ?(msg="") lexbuf =
  let pos = Lexing.(lexbuf.lex_curr_p) in
  let loc = Printf.sprintf "%s:%d:%d" pos.pos_fname pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1) in
  let error = {j|Error parsing record:\n$loc - $msg|j} in
  let json = Js.Dict.empty () in
  Js.Dict.set json "status" (Js.Json.string "failure");
  Js.Dict.set json "error_message" (Js.Json.string error);
  Js.Json.object_ json

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
      >> Response.sendJson (make_failure ())
   | Some text ->
      let lexbuf = Lexing.from_string text in
      try begin
         let people = Wrange.parse_buf_exn lexbuf in
         Response.status Response.StatusCode.Created
         >> Response.sendJson @@ (make_success ())
      end with
      | Lexer.SyntaxError msg ->
         Response.status Response.StatusCode.BadRequest
         >> Response.sendJson @@ make_parsing_failure ~msg lexbuf
      | Parser.Error ->
         Response.status Response.StatusCode.BadRequest
         >> Response.sendJson @@ make_parsing_failure lexbuf
      (* Response.sendString text *)


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
