'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Person = require("./person.bs.js");
var Caml_exceptions = require("bs-platform/lib/js/caml_exceptions.js");
var Caml_builtin_exceptions = require("bs-platform/lib/js/caml_builtin_exceptions.js");

var $$Error = Caml_exceptions.create("Parser.MenhirBasics.Error");

function _menhir_run2(_menhir_env, _menhir_stack, _menhir_s, _v) {
  var _menhir_stack$1 = /* tuple */[
    _menhir_stack,
    _menhir_s,
    _v
  ];
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
                349,
                19
              ]
            ];
      }
      _menhir_env$2[/* _menhir_error */3] = true;
      return _menhir_errorcase(_menhir_env$2, _menhir_stack, _menhir_s);
    } else {
      var _menhir_stack_001 = _tok$1[0];
      var _menhir_stack$2 = /* tuple */[
        _menhir_stack$1,
        _menhir_stack_001
      ];
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
                    315,
                    39
                  ]
                ];
          }
          _menhir_env$4[/* _menhir_error */3] = true;
          return _menhir_errorcase(_menhir_env$4, _menhir_stack, _menhir_s);
        } else {
          var _menhir_stack_001$1 = _tok$3[0];
          var _menhir_stack$3 = /* tuple */[
            _menhir_stack$2,
            _menhir_stack_001$1
          ];
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
                        273,
                        59
                      ]
                    ];
              }
              _menhir_env$6[/* _menhir_error */3] = true;
              return _menhir_errorcase(_menhir_env$6, _menhir_stack, _menhir_s);
            } else {
              var _menhir_stack_001$2 = _tok$5[0];
              var _menhir_stack$4 = /* tuple */[
                _menhir_stack$3,
                _menhir_stack_001$2
              ];
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
                            223,
                            79
                          ]
                        ];
                  }
                  _menhir_env$8[/* _menhir_error */3] = true;
                  return _menhir_errorcase(_menhir_env$8, _menhir_stack, _menhir_s);
                } else {
                  var _menhir_env$9 = _menhir_discard(_menhir_env$8);
                  return _menhir_reduce3(_menhir_env$9, _menhir_stack$4, _tok$7[0]);
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
                          248,
                          69
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
                      294,
                      49
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
                  332,
                  29
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
              362,
              9
            ]
          ];
    }
    _menhir_env$1[/* _menhir_error */3] = true;
    return _menhir_errorcase(_menhir_env$1, _menhir_stack, _menhir_s);
  }
  
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

function _menhir_errorcase(_, __menhir_stack, __menhir_s) {
  while(true) {
    var _menhir_s = __menhir_s;
    var _menhir_stack = __menhir_stack;
    if (_menhir_s !== 1) {
      throw $$Error;
    } else {
      __menhir_s = _menhir_stack[1];
      __menhir_stack = _menhir_stack[0];
      continue ;
    }
  };
}

function _menhir_reduce3(_menhir_env, _menhir_stack, birthday) {
  var match = _menhir_stack[0];
  var match$1 = match[0];
  var match$2 = match$1[0];
  var _menhir_s = match$2[1];
  var _menhir_stack$1 = match$2[0];
  var _v = Person.of_string_description(match$2[2], match$1[1], match[1], _menhir_stack[1], birthday);
  switch (_menhir_s) {
    case 0 : 
        return _v;
    case 1 : 
        if (_menhir_env[/* _menhir_error */3]) {
          throw [
                Caml_builtin_exceptions.assert_failure,
                /* tuple */[
                  "parser.ml",
                  570,
                  20
                ]
              ];
        }
        var _tok = _menhir_env[/* _menhir_token */2];
        var exit = 0;
        if (typeof _tok === "number" && _tok === 0) {
          var _menhir_env$1 = _menhir_discard(_menhir_env);
          var _tok$1 = _menhir_env$1[/* _menhir_token */2];
          var exit$1 = 0;
          if (typeof _tok$1 === "number" && _tok$1 === 1) {
            var _menhir_env$2 = _menhir_discard(_menhir_env$1);
            var match$3 = _menhir_stack$1[0];
            var _v_001 = match$3[1];
            var _v$1 = /* :: */[
              _v,
              _v_001
            ];
            return _menhir_goto_rev_records(_menhir_env$2, match$3[0], _v$1);
          } else {
            exit$1 = 2;
          }
          if (exit$1 === 2) {
            if (_menhir_env$1[/* _menhir_error */3]) {
              throw [
                    Caml_builtin_exceptions.assert_failure,
                    /* tuple */[
                      "parser.ml",
                      622,
                      36
                    ]
                  ];
            }
            _menhir_env$1[/* _menhir_error */3] = true;
            return _menhir_errorcase(_menhir_env$1, _menhir_stack$1, _menhir_s);
          }
          
        } else {
          exit = 1;
        }
        if (exit === 1) {
          if (_menhir_env[/* _menhir_error */3]) {
            throw [
                  Caml_builtin_exceptions.assert_failure,
                  /* tuple */[
                    "parser.ml",
                    635,
                    26
                  ]
                ];
          }
          _menhir_env[/* _menhir_error */3] = true;
          return _menhir_errorcase(_menhir_env, _menhir_stack$1, _menhir_s);
        }
        break;
    case 2 : 
        if (_menhir_env[/* _menhir_error */3]) {
          throw [
                Caml_builtin_exceptions.assert_failure,
                /* tuple */[
                  "parser.ml",
                  656,
                  20
                ]
              ];
        }
        var _tok$2 = _menhir_env[/* _menhir_token */2];
        var exit$2 = 0;
        if (typeof _tok$2 === "number" && _tok$2 === 1) {
          var _menhir_env$3 = _menhir_discard(_menhir_env);
          var _v_001$1 = _menhir_stack$1[1];
          var _v$2 = /* :: */[
            _v,
            _v_001$1
          ];
          return _menhir_goto_rev_records(_menhir_env$3, _menhir_stack$1[0], _v$2);
        } else {
          exit$2 = 1;
        }
        if (exit$2 === 1) {
          var _v_001$2 = _menhir_stack$1[1];
          var _v$3 = /* :: */[
            _v,
            _v_001$2
          ];
          return _menhir_goto_rev_records(_menhir_env, _menhir_stack$1[0], _v$3);
        }
        break;
    
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
            383,
            7
          ]
        ];
  }
  var _tok = _menhir_env[/* _menhir_token */2];
  if (typeof _tok === "number") {
    switch (_tok) {
      case 0 : 
          var _menhir_stack$2 = /* tuple */[
            _menhir_stack$1,
            /* MenhirState1 */2
          ];
          var _menhir_env$1 = _menhir_discard(_menhir_env);
          var _tok$1 = _menhir_env$1[/* _menhir_token */2];
          if (typeof _tok$1 === "number") {
            if (_menhir_env$1[/* _menhir_error */3]) {
              throw [
                    Caml_builtin_exceptions.assert_failure,
                    /* tuple */[
                      "parser.ml",
                      460,
                      23
                    ]
                  ];
            }
            _menhir_env$1[/* _menhir_error */3] = true;
            return _menhir_errorcase(_menhir_env$1, _menhir_stack$2, /* MenhirState11 */1);
          } else {
            return _menhir_run2(_menhir_env$1, _menhir_stack$2, /* MenhirState11 */1, _tok$1[0]);
          }
      case 1 : 
          if (_menhir_env[/* _menhir_error */3]) {
            throw [
                  Caml_builtin_exceptions.assert_failure,
                  /* tuple */[
                    "parser.ml",
                    468,
                    13
                  ]
                ];
          }
          _menhir_env[/* _menhir_error */3] = true;
          return _menhir_errorcase(_menhir_env, _menhir_stack$1, /* MenhirState1 */2);
      case 2 : 
          return _v;
      
    }
  } else {
    return _menhir_run2(_menhir_env, _menhir_stack$1, /* MenhirState1 */2, _tok[0]);
  }
}

function _menhir_init(lexer, lexbuf) {
  return /* record */[
          /* _menhir_lexer */lexer,
          /* _menhir_lexbuf */lexbuf,
          /* _menhir_token : () */0,
          /* _menhir_error */false
        ];
}

function doc(lexer, lexbuf) {
  var _menhir_env = _menhir_init(lexer, lexbuf);
  var _menhir_stack_001 = _menhir_env[/* _menhir_lexbuf */1][/* lex_curr_p */11];
  var _menhir_stack = /* tuple */[
    /* () */0,
    _menhir_stack_001
  ];
  var _menhir_env$1 = _menhir_discard(_menhir_env);
  return _menhir_goto_rev_records(_menhir_env$1, _menhir_stack, /* [] */0);
}

function record(lexer, lexbuf) {
  var _menhir_env = _menhir_init(lexer, lexbuf);
  var _menhir_stack_001 = _menhir_env[/* _menhir_lexbuf */1][/* lex_curr_p */11];
  var _menhir_stack = /* tuple */[
    /* () */0,
    _menhir_stack_001
  ];
  var _menhir_env$1 = _menhir_discard(_menhir_env);
  var _tok = _menhir_env$1[/* _menhir_token */2];
  if (typeof _tok === "number") {
    if (_menhir_env$1[/* _menhir_error */3]) {
      throw [
            Caml_builtin_exceptions.assert_failure,
            /* tuple */[
              "parser.ml",
              1141,
              24
            ]
          ];
    }
    _menhir_env$1[/* _menhir_error */3] = true;
    return _menhir_errorcase(_menhir_env$1, _menhir_stack, /* MenhirState19 */0);
  } else {
    var _menhir_stack_002 = _tok[0];
    var _menhir_stack$1 = /* tuple */[
      _menhir_stack,
      /* MenhirState19 */0,
      _menhir_stack_002
    ];
    var _menhir_env$2 = _menhir_discard(_menhir_env$1);
    var _tok$1 = _menhir_env$2[/* _menhir_token */2];
    var exit = 0;
    if (typeof _tok$1 === "number" && _tok$1 === 0) {
      var _menhir_env$3 = _menhir_discard(_menhir_env$2);
      var _tok$2 = _menhir_env$3[/* _menhir_token */2];
      if (typeof _tok$2 === "number") {
        if (_menhir_env$3[/* _menhir_error */3]) {
          throw [
                Caml_builtin_exceptions.assert_failure,
                /* tuple */[
                  "parser.ml",
                  1115,
                  44
                ]
              ];
        }
        _menhir_env$3[/* _menhir_error */3] = true;
        return _menhir_errorcase(_menhir_env$3, _menhir_stack, /* MenhirState19 */0);
      } else {
        var _menhir_stack_001$1 = _tok$2[0];
        var _menhir_stack$2 = /* tuple */[
          _menhir_stack$1,
          _menhir_stack_001$1
        ];
        var _menhir_env$4 = _menhir_discard(_menhir_env$3);
        var _tok$3 = _menhir_env$4[/* _menhir_token */2];
        var exit$1 = 0;
        if (typeof _tok$3 === "number" && _tok$3 === 0) {
          var _menhir_env$5 = _menhir_discard(_menhir_env$4);
          var _tok$4 = _menhir_env$5[/* _menhir_token */2];
          if (typeof _tok$4 === "number") {
            if (_menhir_env$5[/* _menhir_error */3]) {
              throw [
                    Caml_builtin_exceptions.assert_failure,
                    /* tuple */[
                      "parser.ml",
                      1081,
                      64
                    ]
                  ];
            }
            _menhir_env$5[/* _menhir_error */3] = true;
            return _menhir_errorcase(_menhir_env$5, _menhir_stack, /* MenhirState19 */0);
          } else {
            var _menhir_stack_001$2 = _tok$4[0];
            var _menhir_stack$3 = /* tuple */[
              _menhir_stack$2,
              _menhir_stack_001$2
            ];
            var _menhir_env$6 = _menhir_discard(_menhir_env$5);
            var _tok$5 = _menhir_env$6[/* _menhir_token */2];
            var exit$2 = 0;
            if (typeof _tok$5 === "number" && _tok$5 === 0) {
              var _menhir_env$7 = _menhir_discard(_menhir_env$6);
              var _tok$6 = _menhir_env$7[/* _menhir_token */2];
              if (typeof _tok$6 === "number") {
                if (_menhir_env$7[/* _menhir_error */3]) {
                  throw [
                        Caml_builtin_exceptions.assert_failure,
                        /* tuple */[
                          "parser.ml",
                          1039,
                          84
                        ]
                      ];
                }
                _menhir_env$7[/* _menhir_error */3] = true;
                return _menhir_errorcase(_menhir_env$7, _menhir_stack, /* MenhirState19 */0);
              } else {
                var _menhir_stack_001$3 = _tok$6[0];
                var _menhir_stack$4 = /* tuple */[
                  _menhir_stack$3,
                  _menhir_stack_001$3
                ];
                var _menhir_env$8 = _menhir_discard(_menhir_env$7);
                var _tok$7 = _menhir_env$8[/* _menhir_token */2];
                var exit$3 = 0;
                if (typeof _tok$7 === "number" && _tok$7 === 0) {
                  var _menhir_env$9 = _menhir_discard(_menhir_env$8);
                  var _tok$8 = _menhir_env$9[/* _menhir_token */2];
                  if (typeof _tok$8 === "number") {
                    if (_menhir_env$9[/* _menhir_error */3]) {
                      throw [
                            Caml_builtin_exceptions.assert_failure,
                            /* tuple */[
                              "parser.ml",
                              989,
                              104
                            ]
                          ];
                    }
                    _menhir_env$9[/* _menhir_error */3] = true;
                    return _menhir_errorcase(_menhir_env$9, _menhir_stack, /* MenhirState19 */0);
                  } else {
                    return _menhir_reduce3(_menhir_env$9, _menhir_stack$4, _tok$8[0]);
                  }
                } else {
                  exit$3 = 4;
                }
                if (exit$3 === 4) {
                  if (_menhir_env$8[/* _menhir_error */3]) {
                    throw [
                          Caml_builtin_exceptions.assert_failure,
                          /* tuple */[
                            "parser.ml",
                            1014,
                            94
                          ]
                        ];
                  }
                  _menhir_env$8[/* _menhir_error */3] = true;
                  return _menhir_errorcase(_menhir_env$8, _menhir_stack, /* MenhirState19 */0);
                }
                
              }
            } else {
              exit$2 = 3;
            }
            if (exit$2 === 3) {
              if (_menhir_env$6[/* _menhir_error */3]) {
                throw [
                      Caml_builtin_exceptions.assert_failure,
                      /* tuple */[
                        "parser.ml",
                        1060,
                        74
                      ]
                    ];
              }
              _menhir_env$6[/* _menhir_error */3] = true;
              return _menhir_errorcase(_menhir_env$6, _menhir_stack, /* MenhirState19 */0);
            }
            
          }
        } else {
          exit$1 = 2;
        }
        if (exit$1 === 2) {
          if (_menhir_env$4[/* _menhir_error */3]) {
            throw [
                  Caml_builtin_exceptions.assert_failure,
                  /* tuple */[
                    "parser.ml",
                    1098,
                    54
                  ]
                ];
          }
          _menhir_env$4[/* _menhir_error */3] = true;
          return _menhir_errorcase(_menhir_env$4, _menhir_stack, /* MenhirState19 */0);
        }
        
      }
    } else {
      exit = 1;
    }
    if (exit === 1) {
      if (_menhir_env$2[/* _menhir_error */3]) {
        throw [
              Caml_builtin_exceptions.assert_failure,
              /* tuple */[
                "parser.ml",
                1128,
                34
              ]
            ];
      }
      _menhir_env$2[/* _menhir_error */3] = true;
      return _menhir_errorcase(_menhir_env$2, _menhir_stack, /* MenhirState19 */0);
    }
    
  }
}

exports.$$Error = $$Error;
exports.record = record;
exports.doc = doc;
/* No side effect */
