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
val of_object : abs_person -> person
