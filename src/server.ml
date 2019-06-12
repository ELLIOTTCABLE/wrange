open Express

module TypeIs = struct
   type match_result = Match of string | NoMatch

   (* This is a horrible hack to stuff the untagged union-type returned by type-is's JS
      API into a strictly typed environment safely. *)
   external typeis' : Express.Request.t -> string array -> Js.Json.t = "type-is"
   [@@bs.module]

   let typeis req types =
      match Js.Json.classify (typeis' req types) with
      | Js.Json.JSONFalse ->
            NoMatch
      | Js.Json.JSONString str ->
            Match str
      | _ ->
            failwith "`typeis` returned non-null, non-string value"


   external hasBody : Express.Request.t -> bool = "" [@@bs.module "type-is"]
end

let make_success value =
   let json = Js.Dict.empty () in
   Js.Dict.set json "status" (Js.Json.string "success") ;
   Js.Dict.set json "value" value ;
   Js.Json.object_ json


let make_failure error =
   let json = Js.Dict.empty () in
   Js.Dict.set json "status" (Js.Json.string "failure") ;
   Js.Dict.set json "error" error ;
   Js.Json.object_ json


let make_parsing_failure ?(msg = "") lexbuf =
   let pos = Lexing.(lexbuf.lex_curr_p) in
   let loc =
      Printf.sprintf "%s:%d:%d" pos.pos_fname pos.pos_lnum
         (pos.pos_cnum - pos.pos_bol + 1)
   in
   let error = {j|Error parsing record:\n$loc - $msg|j} in
   make_failure (Js.Json.string error)


let ( >> ) f g x = x |> f |> g

let ( >/> ) : ('a -> 'b option) -> ('b -> 'c option) -> 'a -> 'c option =
   fun f g x -> match f x with Some y -> g y | None -> None


let logRequest next req =
   let open Request in
   let ip' = ip req
   and meth = methodRaw req
   and url = path req
   and text =
      match bodyText req with Some t -> String.concat "" [": \""; t; "\""] | None -> ""
   in
   Js.log {j|$(ip') ~ $meth $(url)$text|j} ;
   next Next.middleware


let addPeople set _next req (* res *) =
   if not (TypeIs.hasBody req) then (
      let error = "Body required for POST /records" in
      print_endline ("!! " ^ error) ;
      Response.status Response.StatusCode.BadRequest
      >> Response.sendJson (make_failure (Js.Json.string error)) )
   else
   match TypeIs.typeis req [|"text/plain"|] with
   | NoMatch ->
         Response.status Response.StatusCode.BadRequest
         >> Response.sendJson
            (make_failure
                (Js.Json.string
                    "Content-Type of `text/plain` required for POST /records"))
   | Match _content_type -> (
         match Request.bodyText req with
         | None ->
               failwith "unreachable: typeis.hasBody lied, or body-parser lied"
         | Some text -> (
               let lexbuf = Lexing.from_string text in
               try
                  let people = Wrange.parse_buf_exn lexbuf in
                  let people' =
                     Array.of_list people
                     |> Array.map (fun person ->
                              PersonSet.add set person ;
                              Person.to_json person)
                  in
                  Response.status Response.StatusCode.Created
                  >> Response.sendJson @@ make_success (Js.Json.array people')
               with
               | Lexer.SyntaxError msg ->
                     Response.status Response.StatusCode.BadRequest
                     >> Response.sendJson @@ make_parsing_failure ~msg lexbuf
               | Parser.Error ->
                     Response.status Response.StatusCode.BadRequest
                     >> Response.sendJson @@ make_parsing_failure lexbuf ) )


let listPeople set _next req (* res *) =
   let params = Request.params req in
   let key =
      match (Js.Dict.get params >/> Js.Json.decodeString) "key" with
      | None ->
            "Last"
      | Some key' ->
            key'
   in
   let order =
      match (Js.Dict.get params >/> Js.Json.decodeString) "order" with
      | None ->
            "Ascending"
      | Some order' ->
            order'
   in
   let people =
      PersonSet.to_array_str_key set key order |> Array.map (fun p -> Person.to_json p)
   in
   Response.status Response.StatusCode.Ok
   >> Response.sendJson @@ make_success (Js.Json.array people)


let announce set port err =
   match err with
   | exception Js.Exn.Error e ->
         Js.log e ;
         Node.Process.exit 1
   | _ ->
         let records = PersonSet.length set |> string_of_int in
         Js.log (String.concat " " ["Serving"; records; "records;"]) ;
         Js.log ("Listening at http://127.0.0.1:" ^ string_of_int port)


let start ?(port = 3000) (set : PersonSet.t) =
   let api = Router.make () in
   Router.get api ~path:"/records/:key/:order" @@ Middleware.from (listPeople set) ;
   Router.get api ~path:"/records/:key" @@ Middleware.from (listPeople set) ;
   Router.get api ~path:"/records" @@ Middleware.from (listPeople set) ;
   Router.post api ~path:"/records" @@ Middleware.from (addPeople set) ;

   let app = App.make () in
   app |. App.use (Middleware.text ()) ;
   app |. App.use (Middleware.from logRequest) ;
   app |. App.useRouterOnPath ~path:"/v1" api ;
   app |. App.listen ~port ~onListen:(announce set port) ()
