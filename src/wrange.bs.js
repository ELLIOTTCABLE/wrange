'use strict';

var Block = require("bs-platform/lib/js/block.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Lexer = require("./lexer.bs.js");
var Js_exn = require("bs-platform/lib/js/js_exn.js");
var Lexing = require("bs-platform/lib/js/lexing.js");
var Parser = require("./parser.bs.js");
var Printf = require("bs-platform/lib/js/printf.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");

function print_position(outx, lexbuf) {
  var pos = lexbuf[/* lex_curr_p */11];
  return Curry._3(Printf.fprintf(outx, /* Format */[
                  /* String */Block.__(2, [
                      /* No_padding */0,
                      /* Char_literal */Block.__(12, [
                          /* ":" */58,
                          /* Int */Block.__(4, [
                              /* Int_d */0,
                              /* No_padding */0,
                              /* No_precision */0,
                              /* Char_literal */Block.__(12, [
                                  /* ":" */58,
                                  /* Int */Block.__(4, [
                                      /* Int_d */0,
                                      /* No_padding */0,
                                      /* No_precision */0,
                                      /* End_of_format */0
                                    ])
                                ])
                            ])
                        ])
                    ]),
                  "%s:%d:%d"
                ]), pos[/* pos_fname */0], pos[/* pos_lnum */1], (pos[/* pos_cnum */3] - pos[/* pos_bol */2] | 0) + 1 | 0);
}

function parse_buf_exn(lexbuf) {
  return Parser.doc(Lexer.read, lexbuf);
}

function parse_buf_print_errors(lexbuf) {
  try {
    return Parser.doc(Lexer.read, lexbuf);
  }
  catch (raw_exn){
    var exn = Js_exn.internalToOCamlException(raw_exn);
    if (exn[0] === Lexer.$$SyntaxError) {
      Curry._3(Printf.fprintf(Pervasives.stderr, /* Format */[
                /* Alpha */Block.__(15, [/* String_literal */Block.__(11, [
                        ": ",
                        /* String */Block.__(2, [
                            /* No_padding */0,
                            /* Char_literal */Block.__(12, [
                                /* "\n" */10,
                                /* End_of_format */0
                              ])
                          ])
                      ])]),
                "%a: %s\n"
              ]), print_position, lexbuf, exn[1]);
      return /* [] */0;
    } else if (exn === Parser.$$Error) {
      Curry._2(Printf.fprintf(Pervasives.stderr, /* Format */[
                /* Alpha */Block.__(15, [/* String_literal */Block.__(11, [
                        ": syntax error\n",
                        /* End_of_format */0
                      ])]),
                "%a: syntax error\n"
              ]), print_position, lexbuf);
      return /* [] */0;
    } else {
      throw exn;
    }
  }
}

function parse_exn(str) {
  var lexbuf = Lexing.from_string(str);
  return Parser.doc(Lexer.read, lexbuf);
}

function parse_print_errors(str) {
  return parse_buf_print_errors(Lexing.from_string(str));
}

exports.parse_exn = parse_exn;
exports.parse_print_errors = parse_print_errors;
exports.parse_buf_exn = parse_buf_exn;
exports.parse_buf_print_errors = parse_buf_print_errors;
/* No side effect */
