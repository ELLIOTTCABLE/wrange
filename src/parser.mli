(* The type of tokens. *)

type token = VAL of string | SEP | NL | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val record : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> Person.t

val doc : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> Person.t list
