type sort_key = Last | First | Gender | Birthday
type sort_order = Ascending | Descending

type gender = [`Male | `Female | `Neither | `Unspecified]
type colour = [`Black | `White | `Red | `Orange | `Yellow | `Green | `Blue | `Indigo | `Violet]

type set
type abs
type t = {
   last_name : string;
   first_name : string;
   gender : gender;
   favourite_colour : colour;
   birthday : Js.Date.t;
}

val create : last_name:string -> first_name:string -> gender:gender ->
   favourite_colour:colour -> birthday:Js.Date.t -> t

val of_string_description : last_name:string -> first_name:string -> gender:string ->
   favourite_colour:string -> birthday:string -> t

(* FIXME: BuckleScript's conversion-routines generate bare `Object` instances, with the appropriate
 *        properties, from ML records. I'd prefer to expose idiomatic instances that inherit from an
 *        exposed `Person.prototype`. *)
val of_object : abs -> t
val to_object : t -> abs

val set_create : unit -> set
val set_add : set -> t -> unit
val set_find_exn : set -> string -> string -> string -> t

val array_of_set : set -> sorts:(sort_key * sort_order) list -> t array

val string_of_birthday : t -> string
val birthday_of_string_exn : string -> Js.Date.t
