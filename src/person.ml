type sort_key = Last | First | Gender | Birthday
type sort_order = Ascending | Descending

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

type set = ((string * string * string), person) Hashtbl.t


let string_of_birthday person =
   let iso8601 = Js.Date.toISOString person.birthday in
   match Js.String.split "T" iso8601 with
   | [| date; _time |] -> date
   | _ -> failwith "Unreachable"

let nobody () =
   { last_name = ""; first_name = ""; gender = Unspecified;
     favourite_colour = Black; birthday = Js.Date.make () }


let create ~last_name ~first_name ~gender ~favourite_colour ~birthday =
   { last_name; first_name; gender; favourite_colour; birthday }

let of_object obj = personFromJs obj

let to_object p = personToJs p


(* NOTE: I'd really prefer to make this a submodule, but ... BuckleScript ... -_-
 *       <https://github.com/BuckleScript/bucklescript/issues/2948> *)
let set_create () =
   Hashtbl.create 100

let set_add set person =
   let key = (person.last_name, person.first_name, string_of_birthday person) in
   Hashtbl.replace set key person

let set_find_exn set last first birthday =
   Hashtbl.find set (last, first, birthday)


(* FIXME: First pass. Needs optimization.
 * FIXME: There's *gotta* be an Array.of_seq or Hashtbl.to_array implementation I can gank,
 *        somewhere. Hate rolling my own for super-generic code like this.*)
let array_of_set (set:set) ~sorts =
   let i = ref 0 in
   let arr = Array.make (Hashtbl.length set) @@ nobody () in
   Hashtbl.iter begin fun _key person ->
      arr.(!i) <- person;
      i := !i + 1
   end set;
   arr
