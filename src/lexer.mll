{
open Lexing
open Parser

exception SyntaxError of string

let next_line lexbuf =
  let pos = lexbuf.lex_curr_p in
  lexbuf.lex_curr_p <-
    { pos with pos_bol = lexbuf.lex_curr_pos;
               pos_lnum = pos.pos_lnum + 1
    }
}

let newline = '\r' | '\n' | "\r\n"
let s = " " | "\t"

let sep = ['|' ',' ' ']

let value = [^ '|' ',' ' ' '\r' '\n']+


rule read =
  parse
  | s* newline s* { next_line lexbuf; NL }
  | s* sep s*     { SEP }
  | value         { VAL (Lexing.lexeme lexbuf) }
  | _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
  | s* eof        { EOF }
