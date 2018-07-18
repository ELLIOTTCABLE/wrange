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

val create : last_name:string -> first_name:string -> gender:gender ->
   favourite_colour:colour -> birthday:Js.Date.t -> person

(* FIXME: BuckleScript's conversion-routines generate bare `Object` instances, with the appropriate
 *        properties, from ML records. I'd prefer to expose idiomatic instances that inherit from an
 *        exposed `Person.prototype`. *)
val of_object : abs_person -> person
val to_object : person -> abs_person

val string_of_birthday : person -> string
