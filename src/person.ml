type sort_key = [`Last | `First | `Gender | `Birthday] [@@bs.deriving jsConverter]

type sort_order = [`Ascending | `Descending] [@@bs.deriving jsConverter]

type gender = [`Male | `Female | `Neither | `Unspecified] [@@bs.deriving jsConverter]

type colour =
   [`Black | `White | `Red | `Orange | `Yellow | `Green | `Blue | `Indigo | `Violet]
[@@bs.deriving jsConverter]

(* XXX: I'd prefer that the type-converters be `Person.fromJs`, not `Person.tFromJs`, etceteras.
 *      Pending <https://github.com/BuckleScript/bucklescript/issues/2947>. *)
type t =
   { last_name : string
   ; first_name : string
   ; gender : gender
   ; favourite_colour : colour
   ; birthday : Js.Date.t }
[@@bs.deriving {jsConverter = newType}]

type abs = abs_t

type set = (string * string * string, t) Hashtbl.t

let string_of_birthday person =
   let iso8601 = Js.Date.toISOString person.birthday in
   match Js.String.split "T" iso8601 with
   | [|date; _time|] ->
         date
   | _ ->
         failwith "Unreachable"


let birthday_of_string_exn iso8601 =
   let date = Js.Date.fromString iso8601 in
   let flo = Js.Date.valueOf date in
   if not @@ Js.Float.isNaN flo then date else failwith "Unparsable date"


let nobody () =
   { last_name = ""
   ; first_name = ""
   ; gender = `Unspecified
   ; favourite_colour = `Black
   ; birthday = Js.Date.make () }


let titlecase str = str |> String.lowercase |> String.capitalize

let create ~last_name ~first_name ~gender ~favourite_colour ~birthday =
   {last_name; first_name; gender; favourite_colour; birthday}


(* TODO: These errors could be, should be, a lot more elaborate. *)
let of_string_description ~last_name ~first_name ~gender ~favourite_colour ~birthday =
   if last_name = "" then failwith "last_name cannot be empty"
   else if first_name = "" then failwith "first_name cannot be empty"
   else
   let gender' =
      match gender |> titlecase |> genderFromJs with
      | Some gender ->
            gender
      | None ->
            failwith {j| '$(gender)' is not a recognized gender. good job! |j}
   and favourite_colour' =
      match favourite_colour |> titlecase |> colourFromJs with
      | Some colour ->
            colour
      | None ->
            failwith {j| '$(favourite_colour)' is not a recognized colour. good job! |j}
   and birthday' = birthday_of_string_exn birthday in
   { last_name
   ; first_name
   ; gender = gender'
   ; favourite_colour = favourite_colour'
   ; birthday = birthday' }


let of_object obj = tFromJs obj

let to_object p = tToJs p

let compare key a b =
   match key with
   | `Last ->
         String.compare a.last_name b.last_name
   | `First ->
         String.compare a.first_name b.first_name
   | `Gender ->
         Pervasives.compare a.gender b.gender
   (* FIXME: Where the hell is the Float module, in BS? *)
   (* | Birthday -> Float.compare ... *)
   | `Birthday ->
         Pervasives.compare (Js.Date.valueOf a.birthday) (Js.Date.valueOf b.birthday)


let of_json_exn json =
   let open Js.Json in
   let open Js.Dict in
   let open Js.Option in
   let d = getExn (decodeObject json) in
   let last_name = get d "last_name" |> getExn |> decodeString |> getExn in
   let first_name = get d "first_name" |> getExn |> decodeString |> getExn in
   let gender = get d "gender" |> getExn |> decodeString |> getExn in
   let favourite_colour = get d "favourite_colour" |> getExn |> decodeString |> getExn in
   let birthday = get d "birthday" |> getExn |> decodeString |> getExn in
   of_string_description ~last_name ~first_name ~gender ~favourite_colour ~birthday


(* FIXME: There's proooobably a better way to do this, in BuckleScript proper, instead of this manual,
 *        imperative building ... *)
let to_json person =
   let json = Js.Dict.empty () in
   Js.Dict.set json "last_name" (Js.Json.string person.last_name) ;
   Js.Dict.set json "first_name" (Js.Json.string person.first_name) ;
   Js.Dict.set json "gender" (Js.Json.string (genderToJs person.gender)) ;
   Js.Dict.set json "favourite_colour"
      (Js.Json.string (colourToJs person.favourite_colour)) ;
   Js.Dict.set json "birthday" (Js.Json.string (Js.Date.toJSONUnsafe person.birthday)) ;
   Js.Json.object_ json


(* NOTE: I'd really prefer to make this a submodule, but ... BuckleScript ... -_-
 *       <https://github.com/BuckleScript/bucklescript/issues/2948> *)
let set_create () = Hashtbl.create 100

let set_add set person =
   let key = (person.last_name, person.first_name, string_of_birthday person) in
   Hashtbl.replace set key person


let set_find_exn set last first birthday = Hashtbl.find set (last, first, birthday)

(* A helper to sort over the given array that uses heap-sort for the lexicographically-least
 * ordering (and often, only ordering); but then uses a stable merge-sort for subsequent
 * reorderings. *)
let lexicographic_step arr i (key, order) =
   let sort = if i = 0 then Array.fast_sort else Array.stable_sort in
   let compare =
      match order with
      | `Ascending ->
            compare key
      | `Descending ->
            fun a b -> ~-(compare key a b)
   in
   sort compare arr


(* FIXME: First pass. Needs optimization.
 * FIXME: Horrific, imperative, jump-off-a-bridge-before-reading implementation.
 * FIXME: There's *gotta* be an Array.of_seq or Hashtbl.to_array implementation I can gank,
 *        somewhere. Hate rolling my own for super-generic code like this.*)
let array_of_set set ~sorts =
   let i = ref 0 in
   let arr = Array.make (Hashtbl.length set) @@ nobody () in
   (fun _key person ->
       arr.(!i) <- person ;
       i := !i + 1)
   |. Hashtbl.iter set ;
   List.iteri (lexicographic_step arr) (List.rev sorts) ;
   arr


let array_of_set_str_key set key order =
   let key' =
      match key |> titlecase |> sort_keyFromJs with
      | Some k ->
            k
      | None ->
            failwith {j| '$(key)' is not a recognized sort-key. |j}
   and order' =
      match order |> titlecase |> sort_orderFromJs with
      | Some o ->
            o
      | None ->
            failwith {j| '$(order)' is not a recognized sort-order. |j}
   in
   array_of_set set ~sorts:[(key', order')]
