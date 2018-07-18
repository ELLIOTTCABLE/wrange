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

let compare key a b =
   match key with
   | Last  -> String.compare a.last_name b.last_name
   | First -> String.compare a.first_name b.first_name
   | Gender -> Pervasives.compare a.gender b.gender
   (* FIXME: Where the hell is the Float module, in BS? *)
   (* | Birthday -> Float.compare ... *)
   | Birthday -> Pervasives.compare (Js.Date.valueOf a.birthday) (Js.Date.valueOf b.birthday)


(* NOTE: I'd really prefer to make this a submodule, but ... BuckleScript ... -_-
 *       <https://github.com/BuckleScript/bucklescript/issues/2948> *)
let set_create () =
   Hashtbl.create 100

let set_add set person =
   let key = (person.last_name, person.first_name, string_of_birthday person) in
   Hashtbl.replace set key person

let set_find_exn set last first birthday =
   Hashtbl.find set (last, first, birthday)


(* A helper to sort over the given array that uses heap-sort for the lexicographically-least
 * ordering (and often, only ordering); but then uses a stable merge-sort for subsequent
 * reorderings. *)
let lexicographic_step arr i (key, order) =
   let sort = if i = 0 then Array.fast_sort else Array.stable_sort in
   let compare = match order with
   | Ascending -> compare key
   | Descending -> (fun a b -> ~-(compare key a b))
   in
   sort compare arr

(* FIXME: First pass. Needs optimization.
 * FIXME: Horrific, imperative, jump-off-a-bridge-before-reading implementation.
 * FIXME: There's *gotta* be an Array.of_seq or Hashtbl.to_array implementation I can gank,
 *        somewhere. Hate rolling my own for super-generic code like this.*)
let array_of_set (set:set) ~sorts =
   let i = ref 0 in
   let arr = Array.make (Hashtbl.length set) @@ nobody () in
   begin fun _key person ->
      arr.(!i) <- person;
      i := !i + 1
   end
   |. Hashtbl.iter set;
   List.iteri (lexicographic_step arr) (List.rev sorts);
   arr
