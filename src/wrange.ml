open Lexing

(* FIXME: This should really use Formatter, log, node-debug ... anything other than unreservedly
 *        dumping to stderr on failure. Oh well. *)
let print_position outx lexbuf =
  let pos = lexbuf.lex_curr_p in
  Printf.fprintf outx "%s:%d:%d" pos.pos_fname
    pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)


let parse_buf_exn lexbuf =
   Parser.doc Lexer.read lexbuf

let parse_buf_print_errors lexbuf =
  try parse_buf_exn lexbuf with
  | Lexer.SyntaxError msg ->
    Printf.fprintf stderr "%a: %s\n" print_position lexbuf msg;
    []
  | Parser.Error ->
    Printf.fprintf stderr "%a: syntax error\n" print_position lexbuf;
    []

let parse_exn str =
   parse_buf_exn (Lexing.from_string str)

let parse_print_errors str =
   parse_buf_print_errors (Lexing.from_string str)
