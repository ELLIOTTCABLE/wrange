type sort_key = [`Last | `First | `Gender | `Birthday] [@@bs.deriving jsConverter]

type sort_order = [`Ascending | `Descending] [@@bs.deriving jsConverter]

type t = (string * string * string, Person.t) Hashtbl.t

let create () = Hashtbl.create 100

let add set person =
   let open Person in
   let key = (person.last_name, person.first_name, string_of_birthday person) in
   Hashtbl.replace set key person


let length = Hashtbl.length

let find_exn set last first birthday = Hashtbl.find set (last, first, birthday)

(* FIXME: duplicate. *)
let titlecase str = str |> String.lowercase |> String.capitalize

(* A helper to sort over the given array that uses heap-sort for the lexicographically-least
 * ordering (and often, only ordering); but then uses a stable merge-sort for subsequent
 * reorderings. *)
let lexicographic_step arr i (key, order) =
   let sort = if i = 0 then Array.fast_sort else Array.stable_sort in
   let compare =
      match order with
      | `Ascending ->
            Person.compare key
      | `Descending ->
            fun a b -> ~-(Person.compare key a b)
   in
   sort compare arr


(* FIXME: First pass. Needs optimization.
 * FIXME: Horrific, imperative, jump-off-a-bridge-before-reading implementation.
 * FIXME: There's *gotta* be an Array.of_seq or Hashtbl.to_array implementation I can gank,
 *        somewhere. Hate rolling my own for super-generic code like this.*)
let to_array set ~sorts =
   let i = ref 0 in
   let arr = Array.make (Hashtbl.length set) @@ Person.nobody () in
   (fun _key person ->
       arr.(!i) <- person ;
       i := !i + 1)
   |. Hashtbl.iter set ;
   List.iteri (lexicographic_step arr) (List.rev sorts) ;
   arr


let to_array_str_key set key order =
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
   to_array set ~sorts:[(key', order')]
