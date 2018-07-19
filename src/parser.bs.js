'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Person = require("./person.bs.js");
var Caml_exceptions = require("bs-platform/lib/js/caml_exceptions.js");
var Caml_builtin_exceptions = require("bs-platform/lib/js/caml_builtin_exceptions.js");

var $$Error = Caml_exceptions.create("Parser.MenhirBasics.Error");

function _menhir_discard(_menhir_env) {
  var lexer = _menhir_env[/* _menhir_lexer */0];
  var lexbuf = _menhir_env[/* _menhir_lexbuf */1];
  var _tok = Curry._1(lexer, lexbuf);
  return /* record */[
          /* _menhir_lexer */lexer,
          /* _menhir_lexbuf */lexbuf,
          /* _menhir_token */_tok,
          /* _menhir_error */false
        ];
}

function doc(lexer, lexbuf) {
  var _menhir_env = /* record */[
    /* _menhir_lexer */lexer,
    /* _menhir_lexbuf */lexbuf,
    /* _menhir_token : () */0,
    /* _menhir_error */false
  ];
  var _menhir_stack_001 = _menhir_env[/* _menhir_lexbuf */1][/* lex_curr_p */11];
  var _menhir_stack = /* tuple */[
    /* () */0,
    _menhir_stack_001
  ];
  var _menhir_env$1 = _menhir_discard(_menhir_env);
  var __menhir_env = _menhir_env$1;
  var __menhir_stack = _menhir_stack;
  var __v = /* [] */0;
  while(true) {
    var _v = __v;
    var _menhir_stack$1 = __menhir_stack;
    var _menhir_env$2 = __menhir_env;
    var _menhir_stack$2 = /* tuple */[
      _menhir_stack$1,
      _v
    ];
    if (_menhir_env$2[/* _menhir_error */3]) {
      throw [
            Caml_builtin_exceptions.assert_failure,
            /* tuple */[
              "parser.ml",
              40,
              5
            ]
          ];
    }
    var _tok = _menhir_env$2[/* _menhir_token */2];
    if (typeof _tok === "number") {
      if (_tok >= 2) {
        return _v;
      } else {
        if (_menhir_env$2[/* _menhir_error */3]) {
          throw [
                Caml_builtin_exceptions.assert_failure,
                /* tuple */[
                  "parser.ml",
                  532,
                  8
                ]
              ];
        }
        _menhir_env$2[/* _menhir_error */3] = true;
        throw $$Error;
      }
    } else {
      var _menhir_stack_001$1 = _tok[0];
      var _menhir_env$3 = _menhir_discard(_menhir_env$2);
      var _tok$1 = _menhir_env$3[/* _menhir_token */2];
      var exit = 0;
      if (typeof _tok$1 === "number" && _tok$1 === 0) {
        var _menhir_env$4 = _menhir_discard(_menhir_env$3);
        var _tok$2 = _menhir_env$4[/* _menhir_token */2];
        if (typeof _tok$2 === "number") {
          if (_menhir_env$4[/* _menhir_error */3]) {
            throw [
                  Caml_builtin_exceptions.assert_failure,
                  /* tuple */[
                    "parser.ml",
                    508,
                    16
                  ]
                ];
          }
          _menhir_env$4[/* _menhir_error */3] = true;
          throw $$Error;
        } else {
          var _menhir_env$5 = _menhir_discard(_menhir_env$4);
          var _tok$3 = _menhir_env$5[/* _menhir_token */2];
          var exit$1 = 0;
          if (typeof _tok$3 === "number" && _tok$3 === 0) {
            var _menhir_env$6 = _menhir_discard(_menhir_env$5);
            var _tok$4 = _menhir_env$6[/* _menhir_token */2];
            if (typeof _tok$4 === "number") {
              if (_menhir_env$6[/* _menhir_error */3]) {
                throw [
                      Caml_builtin_exceptions.assert_failure,
                      /* tuple */[
                        "parser.ml",
                        476,
                        24
                      ]
                    ];
              }
              _menhir_env$6[/* _menhir_error */3] = true;
              throw $$Error;
            } else {
              var _menhir_env$7 = _menhir_discard(_menhir_env$6);
              var _tok$5 = _menhir_env$7[/* _menhir_token */2];
              var exit$2 = 0;
              if (typeof _tok$5 === "number" && _tok$5 === 0) {
                var _menhir_env$8 = _menhir_discard(_menhir_env$7);
                var _tok$6 = _menhir_env$8[/* _menhir_token */2];
                if (typeof _tok$6 === "number") {
                  if (_menhir_env$8[/* _menhir_error */3]) {
                    throw [
                          Caml_builtin_exceptions.assert_failure,
                          /* tuple */[
                            "parser.ml",
                            436,
                            32
                          ]
                        ];
                  }
                  _menhir_env$8[/* _menhir_error */3] = true;
                  throw $$Error;
                } else {
                  var _menhir_env$9 = _menhir_discard(_menhir_env$8);
                  var _tok$7 = _menhir_env$9[/* _menhir_token */2];
                  var exit$3 = 0;
                  if (typeof _tok$7 === "number" && _tok$7 === 0) {
                    var _menhir_env$10 = _menhir_discard(_menhir_env$9);
                    var _tok$8 = _menhir_env$10[/* _menhir_token */2];
                    if (typeof _tok$8 === "number") {
                      if (_menhir_env$10[/* _menhir_error */3]) {
                        throw [
                              Caml_builtin_exceptions.assert_failure,
                              /* tuple */[
                                "parser.ml",
                                388,
                                40
                              ]
                            ];
                      }
                      _menhir_env$10[/* _menhir_error */3] = true;
                      throw $$Error;
                    } else {
                      var _menhir_env$11 = _menhir_discard(_menhir_env$10);
                      var _menhir_stack$3 = _menhir_stack$2;
                      var _v$1 = Person.of_string_description(_menhir_stack_001$1, _tok$2[0], _tok$4[0], _tok$6[0], _tok$8[0]);
                      if (_menhir_env$11[/* _menhir_error */3]) {
                        throw [
                              Caml_builtin_exceptions.assert_failure,
                              /* tuple */[
                                "parser.ml",
                                355,
                                41
                              ]
                            ];
                      }
                      var _tok$9 = _menhir_env$11[/* _menhir_token */2];
                      var exit$4 = 0;
                      if (typeof _tok$9 === "number" && _tok$9 === 1) {
                        var _menhir_env$12 = _menhir_discard(_menhir_env$11);
                        var _v_001 = _menhir_stack$3[1];
                        var _v$2 = /* :: */[
                          _v$1,
                          _v_001
                        ];
                        __v = _v$2;
                        __menhir_stack = _menhir_stack$3[0];
                        __menhir_env = _menhir_env$12;
                        continue ;
                      } else {
                        exit$4 = 5;
                      }
                      if (exit$4 === 5) {
                        if (_menhir_env$11[/* _menhir_error */3]) {
                          throw [
                                Caml_builtin_exceptions.assert_failure,
                                /* tuple */[
                                  "parser.ml",
                                  380,
                                  44
                                ]
                              ];
                        }
                        _menhir_env$11[/* _menhir_error */3] = true;
                        throw $$Error;
                      }
                      
                    }
                  } else {
                    exit$3 = 4;
                  }
                  if (exit$3 === 4) {
                    if (_menhir_env$9[/* _menhir_error */3]) {
                      throw [
                            Caml_builtin_exceptions.assert_failure,
                            /* tuple */[
                              "parser.ml",
                              412,
                              36
                            ]
                          ];
                    }
                    _menhir_env$9[/* _menhir_error */3] = true;
                    throw $$Error;
                  }
                  
                }
              } else {
                exit$2 = 3;
              }
              if (exit$2 === 3) {
                if (_menhir_env$7[/* _menhir_error */3]) {
                  throw [
                        Caml_builtin_exceptions.assert_failure,
                        /* tuple */[
                          "parser.ml",
                          456,
                          28
                        ]
                      ];
                }
                _menhir_env$7[/* _menhir_error */3] = true;
                throw $$Error;
              }
              
            }
          } else {
            exit$1 = 2;
          }
          if (exit$1 === 2) {
            if (_menhir_env$5[/* _menhir_error */3]) {
              throw [
                    Caml_builtin_exceptions.assert_failure,
                    /* tuple */[
                      "parser.ml",
                      492,
                      20
                    ]
                  ];
            }
            _menhir_env$5[/* _menhir_error */3] = true;
            throw $$Error;
          }
          
        }
      } else {
        exit = 1;
      }
      if (exit === 1) {
        if (_menhir_env$3[/* _menhir_error */3]) {
          throw [
                Caml_builtin_exceptions.assert_failure,
                /* tuple */[
                  "parser.ml",
                  520,
                  12
                ]
              ];
        }
        _menhir_env$3[/* _menhir_error */3] = true;
        throw $$Error;
      }
      
    }
  };
}

exports.$$Error = $$Error;
exports.doc = doc;
/* No side effect */
