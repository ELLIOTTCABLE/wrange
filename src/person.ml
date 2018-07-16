type gender = Male | Female | Neither | Unspecified
type colour = Black | White | Red | Orange | Yellow | Green | Blue | Indigo | Violet

(* XXX: I'd prefer that the type-converters be `Person.fromJs`, not `Person.tFromJs`, etceteras.
 *      Pending <https://github.com/BuckleScript/bucklescript/issues/2947>. *)
type person = {
   last_name : string;
   first_name : string;
   gender : gender;
   favourite_colour : colour;
   birthday : Js.Date.t;
} [@@bs.deriving {jsConverter = newType}]
type t = person

let create ~last_name ~first_name ~gender ~favourite_colour ~birthday =
   {
      last_name = last_name;
      first_name = first_name;
      gender = gender;
      favourite_colour = favourite_colour;
      birthday = birthday;
   }

let of_object obj = personFromJs obj

let to_object p = personToJs p
