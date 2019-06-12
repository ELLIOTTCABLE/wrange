type t

val create : unit -> t

val add : t -> Person.t -> unit

val of_records_exn : string -> t
(** [of_records_exn records] creates a set of records from the given [records] by
    invoking the record-parser. Can throw exceptions on malformed input, including
    [Lexer.SyntaxError] and [Parser.Error]. *)

val of_file_exn : string -> t
(** [of_file_exn path] reads in the entire file at [path], and invokes the record-parser
    on the contents. Can throw filesystem exceptions; as well as those caused by
    malformed input, including [Lexer.SyntaxError] and [Parser.Error]. *)

val add : t -> Person.t -> unit

val add_all
   :  ?on_conflict:(src_member:Person.t -> dest_member:Person.t -> Person.t)
   -> src:t
   -> dest:t
   -> unit
   -> unit
(** Merges the entries of the [src] set into the [dest] set. This modifies [dest].

    In the case that a key in [src] already has an associated value in [dest], the
    default behaviour is to overwrite it with the newer value from [src]; but this can be
    overridden with the optional [on_conflict] callback. *)

val length : t -> int

val find_exn : t -> string -> string -> string -> Person.t

val to_array : t -> sorts:(Person.sort_key * Person.sort_order) list -> Person.t array

val to_array_str_sorts : t -> sorts:(string * string) list -> Person.t array
