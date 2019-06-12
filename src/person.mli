type sort_key = [`Last | `First | `Gender | `Birthday] [@@bs.deriving jsConverter]

type sort_order = [`Ascending | `Descending] [@@bs.deriving jsConverter]

type gender = [`Male | `Female | `Neither | `Unspecified]

type colour =
   [`Black | `White | `Red | `Orange | `Yellow | `Green | `Blue | `Indigo | `Violet]

type abs

type t =
   { last_name : string
   ; first_name : string
   ; gender : gender
   ; favourite_colour : colour
   ; birthday : Js.Date.t }

val create
   :  last_name:string
   -> first_name:string
   -> gender:gender
   -> favourite_colour:colour
   -> birthday:Js.Date.t
   -> t

val of_string_description
   :  last_name:string
   -> first_name:string
   -> gender:string
   -> favourite_colour:string
   -> birthday:string
   -> t

(* FIXME: BuckleScript's conversion-routines generate bare `Object` instances, with the appropriate
 *        properties, from ML records. I'd prefer to expose idiomatic instances that inherit from an
 *        exposed `Person.prototype`. *)
val of_object : abs -> t

val to_object : t -> abs

val of_json_exn : Js.Json.t -> t

val to_json : t -> Js.Json.t

val nobody : unit -> t

val compare : sort_key -> t -> t -> int

val string_of_birthday : t -> string

val birthday_of_string_exn : string -> Js.Date.t
