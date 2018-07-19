'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Person = require("./person.bs.js");
var Caml_exceptions = require("bs-platform/lib/js/caml_exceptions.js");
var Caml_builtin_exceptions = require("bs-platform/lib/js/caml_builtin_exceptions.js");

var $$Error = Caml_exceptions.create("Parser.MenhirBasics.Error");

function _menhir_errorcase(_, __menhir_stack, __menhir_s) {
  while(true) {
    var _menhir_s = __menhir_s;
    var _menhir_stack = __menhir_stack;
    if (_menhir_s) {
      throw $$Error;
    } else {
      __menhir_s = _menhir_stack[1];
      __menhir_stack = _menhir_stack[0];
      continue ;
    }
  };
}

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

function _menhir_run2(_menhir_env, _menhir_stack, _menhir_s, _v) {
  var _menhir_env$1 = _menhir_discard(_menhir_env);
  var _tok = _menhir_env$1[/* _menhir_token */2];
  var exit = 0;
  if (typeof _tok === "number" && _tok === 0) {
    var _menhir_env$2 = _menhir_discard(_menhir_env$1);
    var _tok$1 = _menhir_env$2[/* _menhir_token */2];
    if (typeof _tok$1 === "number") {
      if (_menhir_env$2[/* _menhir_error */3]) {
        throw [
              Caml_builtin_exceptions.assert_failure,
              /* tuple */[
                "parser.ml",
                523,
                12
              ]
            ];
      }
      _menhir_env$2[/* _menhir_error */3] = true;
      return _menhir_errorcase(_menhir_env$2, _menhir_stack, _menhir_s);
    } else {
      var _menhir_env$3 = _menhir_discard(_menhir_env$2);
      var _tok$2 = _menhir_env$3[/* _menhir_token */2];
      var exit$1 = 0;
      if (typeof _tok$2 === "number" && _tok$2 === 0) {
        var _menhir_env$4 = _menhir_discard(_menhir_env$3);
        var _tok$3 = _menhir_env$4[/* _menhir_token */2];
        if (typeof _tok$3 === "number") {
          if (_menhir_env$4[/* _menhir_error */3]) {
            throw [
                  Caml_builtin_exceptions.assert_failure,
                  /* tuple */[
                    "parser.ml",
                    489,
                    20
                  ]
                ];
          }
          _menhir_env$4[/* _menhir_error */3] = true;
          return _menhir_errorcase(_menhir_env$4, _menhir_stack, _menhir_s);
        } else {
          var _menhir_env$5 = _menhir_discard(_menhir_env$4);
          var _tok$4 = _menhir_env$5[/* _menhir_token */2];
          var exit$2 = 0;
          if (typeof _tok$4 === "number" && _tok$4 === 0) {
            var _menhir_env$6 = _menhir_discard(_menhir_env$5);
            var _tok$5 = _menhir_env$6[/* _menhir_token */2];
            if (typeof _tok$5 === "number") {
              if (_menhir_env$6[/* _menhir_error */3]) {
                throw [
                      Caml_builtin_exceptions.assert_failure,
                      /* tuple */[
                        "parser.ml",
                        447,
                        28
                      ]
                    ];
              }
              _menhir_env$6[/* _menhir_error */3] = true;
              return _menhir_errorcase(_menhir_env$6, _menhir_stack, _menhir_s);
            } else {
              var _menhir_env$7 = _menhir_discard(_menhir_env$6);
              var _tok$6 = _menhir_env$7[/* _menhir_token */2];
              var exit$3 = 0;
              if (typeof _tok$6 === "number" && _tok$6 === 0) {
                var _menhir_env$8 = _menhir_discard(_menhir_env$7);
                var _tok$7 = _menhir_env$8[/* _menhir_token */2];
                if (typeof _tok$7 === "number") {
                  if (_menhir_env$8[/* _menhir_error */3]) {
                    throw [
                          Caml_builtin_exceptions.assert_failure,
                          /* tuple */[
                            "parser.ml",
                            397,
                            36
                          ]
                        ];
                  }
                  _menhir_env$8[/* _menhir_error */3] = true;
                  return _menhir_errorcase(_menhir_env$8, _menhir_stack, _menhir_s);
                } else {
                  var _menhir_env$9 = _menhir_discard(_menhir_env$8);
                  var _menhir_s$1 = _menhir_s;
                  var _menhir_stack$1 = _menhir_stack;
                  var _v$1 = Person.of_string_description(_v, _tok$1[0], _tok$3[0], _tok$5[0], _tok$7[0]);
                  if (_menhir_s$1) {
                    if (_menhir_env$9[/* _menhir_error */3]) {
                      throw [
                            Caml_builtin_exceptions.assert_failure,
                            /* tuple */[
                              "parser.ml",
                              360,
                              41
                            ]
                          ];
                    }
                    var _tok$8 = _menhir_env$9[/* _menhir_token */2];
                    var exit$4 = 0;
                    if (typeof _tok$8 === "number" && _tok$8 === 1) {
                      var _menhir_env$10 = _menhir_discard(_menhir_env$9);
                      var _v_001 = _menhir_stack$1[1];
                      var _v$2 = /* :: */[
                        _v$1,
                        _v_001
                      ];
                      return _menhir_goto_rev_records(_menhir_env$10, _menhir_stack$1[0], _v$2);
                    } else {
                      exit$4 = 5;
                    }
                    if (exit$4 === 5) {
                      var _v_001$1 = _menhir_stack$1[1];
                      var _v$3 = /* :: */[
                        _v$1,
                        _v_001$1
                      ];
                      return _menhir_goto_rev_records(_menhir_env$9, _menhir_stack$1[0], _v$3);
                    }
                    
                  } else {
                    if (_menhir_env$9[/* _menhir_error */3]) {
                      throw [
                            Caml_builtin_exceptions.assert_failure,
                            /* tuple */[
                              "parser.ml",
                              302,
                              41
                            ]
                          ];
                    }
                    var _tok$9 = _menhir_env$9[/* _menhir_token */2];
                    var exit$5 = 0;
                    if (typeof _tok$9 === "number" && _tok$9 === 0) {
                      var _menhir_env$11 = _menhir_discard(_menhir_env$9);
                      var _tok$10 = _menhir_env$11[/* _menhir_token */2];
                      var exit$6 = 0;
                      if (typeof _tok$10 === "number" && _tok$10 === 1) {
                        var _menhir_env$12 = _menhir_discard(_menhir_env$11);
                        var match = _menhir_stack$1[0];
                        var _v_001$2 = match[1];
                        var _v$4 = /* :: */[
                          _v$1,
                          _v_001$2
                        ];
                        return _menhir_goto_rev_records(_menhir_env$12, match[0], _v$4);
                      } else {
                        exit$6 = 6;
                      }
                      if (exit$6 === 6) {
                        if (_menhir_env$11[/* _menhir_error */3]) {
                          throw [
                                Caml_builtin_exceptions.assert_failure,
                                /* tuple */[
                                  "parser.ml",
                                  338,
                                  48
                                ]
                              ];
                        }
                        _menhir_env$11[/* _menhir_error */3] = true;
                        return _menhir_errorcase(_menhir_env$11, _menhir_stack$1, _menhir_s$1);
                      }
                      
                    } else {
                      exit$5 = 5;
                    }
                    if (exit$5 === 5) {
                      if (_menhir_env$9[/* _menhir_error */3]) {
                        throw [
                              Caml_builtin_exceptions.assert_failure,
                              /* tuple */[
                                "parser.ml",
                                347,
                                44
                              ]
                            ];
                      }
                      _menhir_env$9[/* _menhir_error */3] = true;
                      return _menhir_errorcase(_menhir_env$9, _menhir_stack$1, _menhir_s$1);
                    }
                    
                  }
                }
              } else {
                exit$3 = 4;
              }
              if (exit$3 === 4) {
                if (_menhir_env$7[/* _menhir_error */3]) {
                  throw [
                        Caml_builtin_exceptions.assert_failure,
                        /* tuple */[
                          "parser.ml",
                          422,
                          32
                        ]
                      ];
                }
                _menhir_env$7[/* _menhir_error */3] = true;
                return _menhir_errorcase(_menhir_env$7, _menhir_stack, _menhir_s);
              }
              
            }
          } else {
            exit$2 = 3;
          }
          if (exit$2 === 3) {
            if (_menhir_env$5[/* _menhir_error */3]) {
              throw [
                    Caml_builtin_exceptions.assert_failure,
                    /* tuple */[
                      "parser.ml",
                      468,
                      24
                    ]
                  ];
            }
            _menhir_env$5[/* _menhir_error */3] = true;
            return _menhir_errorcase(_menhir_env$5, _menhir_stack, _menhir_s);
          }
          
        }
      } else {
        exit$1 = 2;
      }
      if (exit$1 === 2) {
        if (_menhir_env$3[/* _menhir_error */3]) {
          throw [
                Caml_builtin_exceptions.assert_failure,
                /* tuple */[
                  "parser.ml",
                  506,
                  16
                ]
              ];
        }
        _menhir_env$3[/* _menhir_error */3] = true;
        return _menhir_errorcase(_menhir_env$3, _menhir_stack, _menhir_s);
      }
      
    }
  } else {
    exit = 1;
  }
  if (exit === 1) {
    if (_menhir_env$1[/* _menhir_error */3]) {
      throw [
            Caml_builtin_exceptions.assert_failure,
            /* tuple */[
              "parser.ml",
              536,
              8
            ]
          ];
    }
    _menhir_env$1[/* _menhir_error */3] = true;
    return _menhir_errorcase(_menhir_env$1, _menhir_stack, _menhir_s);
  }
  
}

function _menhir_goto_rev_records(_menhir_env, _menhir_stack, _v) {
  var _menhir_stack$1 = /* tuple */[
    _menhir_stack,
    _v
  ];
  if (_menhir_env[/* _menhir_error */3]) {
    throw [
          Caml_builtin_exceptions.assert_failure,
          /* tuple */[
            "parser.ml",
            557,
            5
          ]
        ];
  }
  var _tok = _menhir_env[/* _menhir_token */2];
  if (typeof _tok === "number") {
    switch (_tok) {
      case 0 : 
          var _menhir_stack$2 = /* tuple */[
            _menhir_stack$1,
            /* MenhirState1 */1
          ];
          var _menhir_env$1 = _menhir_discard(_menhir_env);
          var _tok$1 = _menhir_env$1[/* _menhir_token */2];
          if (typeof _tok$1 === "number") {
            if (_menhir_env$1[/* _menhir_error */3]) {
              throw [
                    Caml_builtin_exceptions.assert_failure,
                    /* tuple */[
                      "parser.ml",
                      634,
                      12
                    ]
                  ];
            }
            _menhir_env$1[/* _menhir_error */3] = true;
            return _menhir_errorcase(_menhir_env$1, _menhir_stack$2, /* MenhirState11 */0);
          } else {
            return _menhir_run2(_menhir_env$1, _menhir_stack$2, /* MenhirState11 */0, _tok$1[0]);
          }
      case 1 : 
          if (_menhir_env[/* _menhir_error */3]) {
            throw [
                  Caml_builtin_exceptions.assert_failure,
                  /* tuple */[
                    "parser.ml",
                    642,
                    8
                  ]
                ];
          }
          _menhir_env[/* _menhir_error */3] = true;
          throw $$Error;
      case 2 : 
          return _v;
      
    }
  } else {
    return _menhir_run2(_menhir_env, _menhir_stack$1, /* MenhirState1 */1, _tok[0]);
  }
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
  return _menhir_goto_rev_records(_menhir_env$1, _menhir_stack, /* [] */0);
}

exports.$$Error = $$Error;
exports.doc = doc;
/* No side effect */
