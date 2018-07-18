type sort_key = Last | First | Gender | Birthday
type sort_order = Ascending | Descending

type gender = Male | Female | Neither | Unspecified
type colour = Black | White | Red | Orange | Yellow | Green | Blue | Indigo | Violet

type abs_person
type person = {
   last_name : string;
   first_name : string;
   gender : gender;
   favourite_colour : colour;
   birthday : Js.Date.t;
}
type set

val create : last_name:string -> first_name:string -> gender:gender ->
   favourite_colour:colour -> birthday:Js.Date.t -> person

(* FIXME: BuckleScript's conversion-routines generate bare `Object` instances, with the appropriate
 *        properties, from ML records. I'd prefer to expose idiomatic instances that inherit from an
 *        exposed `Person.prototype`. *)
val of_object : abs_person -> person
val to_object : person -> abs_person

val set_create : unit -> set
val set_add : set -> person -> unit
val set_find_exn : set -> string -> string -> string -> person

val array_of_set : set -> sorts:(sort_key * sort_order) list -> person array

val string_of_birthday : person -> string
