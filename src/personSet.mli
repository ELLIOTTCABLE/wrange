type t

val create : unit -> t

val add : t -> Person.t -> unit

val length : t -> int

val find_exn : t -> string -> string -> string -> Person.t

val to_array : t -> sorts:(Person.sort_key * Person.sort_order) list -> Person.t array

val to_array_str_key : t -> string -> string -> Person.t array
