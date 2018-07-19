open Express

let make_success () =
  let json = Js.Dict.empty () in
  Js.Dict.set json "success" (Js.Json.boolean true); Js.Json.object_ json

let make_failure () =
  let json = Js.Dict.empty () in
  Js.Dict.set json "status" (Js.Json.string "failure"); Js.Json.object_ json

let getDictString dict key =
  match Js.Dict.get dict key with
  | ((Some (json))[@explicit_arity ]) -> Js.Json.decodeString json
  | _ -> None

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

let addPerson next req (* res *) =
   match Request.bodyText req with
   | None ->
      Response.status Response.StatusCode.BadRequest
      >> Response.sendJson (make_failure ())
   | Some text ->
         Response.sendString text


let onListen err = match err with
  | exception Js.Exn.Error e -> Js.log e; Node.Process.exit 1
  | _ -> Js.log "Listening at http://127.0.0.1:3000"


let _ =
   let api = Router.make () in

   Router.post api ~path:"/records" @@ Middleware.from addPerson;

   let app = App.make () in
   app |. App.use (Middleware.text ());
   app |. App.use (Middleware.from logRequest);
   app |. App.useRouterOnPath ~path:"/v1" api;
   app |. App.listen ~port:3000 ~onListen ()
