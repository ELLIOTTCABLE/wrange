open Express

let makeSuccessJson () =
  let json = Js.Dict.empty () in
  Js.Dict.set json "success" (Js.Json.boolean true); Js.Json.object_ json


let app = App.make ()

let _ =
  App.get app ~path:"/method" @@
  Middleware.from begin fun next req ->
     let open Request in
     match httpMethod req with
     | Get -> Response.sendJson @@ makeSuccessJson ()
     | s -> Js.log s; next Next.route
  end

let _ =
   App.listen app ~port:3000 ()
