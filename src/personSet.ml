type t = (string * string * string, Person.t) Hashtbl.t

let create () = Hashtbl.create 100

let add set person =
   let open Person in
   let key = (person.last_name, person.first_name, iso8601_of_birthday person) in
   Hashtbl.replace set key person


let of_records_exn records =
   let set = create () in
   let lexbuf = Lexing.from_string records in
   let people = Wrange.parse_buf_exn lexbuf in
   people |> List.iter (fun person -> add set person) ;
   set


let of_file_exn path =
   (* FIXME: Why does this take a meaningless second argument? BuckleScript bug? *)
   let path' = Node.Path.resolve path "" in
   let contents = Node.Fs.readFileSync path' `utf8 in
   of_records_exn contents


let take_src ~src_member ~dest_member = src_member

(* If [on_conflict] isn't provided, this conflict-handler will simply overwrite
   pre-existing bindings in [dest] with the new ones from [src]. *)
(* FIXME: This shouldn't need the additional [unit] argument; but for some reason, I
   can't get the OCaml compiler to agree ... *)
let add_all ?(on_conflict = take_src) ~src ~dest () =
   src
   |> Hashtbl.iter (fun k v ->
            if Hashtbl.mem dest k then
               let existing = Hashtbl.find dest k in
               let replacement = on_conflict ~src_member:v ~dest_member:existing in
               Hashtbl.replace dest k replacement
            else Hashtbl.add dest k v)


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


let to_array_str_sorts set ~sorts =
   let sorts' =
      sorts
      |> List.map (fun (key, order) ->
               let key' =
                  match key |> titlecase |> Person.sort_keyFromJs with
                  | Some k ->
                        k
                  | None ->
                        failwith {j| '$(key)' is not a recognized sort-key. |j}
               and order' =
                  match order |> titlecase |> Person.sort_orderFromJs with
                  | Some o ->
                        o
                  | None ->
                        failwith {j| '$(order)' is not a recognized sort-order. |j}
               in
               (key', order'))
   in
   to_array set ~sorts:sorts'
