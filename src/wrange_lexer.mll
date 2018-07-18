{
open Lexing
open Wrange_parser

exception SyntaxError of string

let next_line lexbuf =
  let pos = lexbuf.lex_curr_p in
  lexbuf.lex_curr_p <-
    { pos with pos_bol = lexbuf.lex_curr_pos;
               pos_lnum = pos.pos_lnum + 1
    }
}

let sep = ['|' ',' ' ']
let white = " " | "\t"
let spaced_sep = white* sep white*

let value = [^ '|' ',' ' ' '\r' '\n']+

let newline = '\r' | '\n' | "\r\n"

rule read =
  parse
  | newline    { next_line lexbuf; NL }
  | spaced_sep { SEP }
  | value      { VAL (Lexing.lexeme lexbuf) }
  | _ { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }
  | eof      { EOF }
