'use strict';

var $$Array = require("bs-platform/lib/js/array.js");
var Block = require("bs-platform/lib/js/block.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Lexer = require("./lexer.bs.js");
var Js_exn = require("bs-platform/lib/js/js_exn.js");
var Lexing = require("bs-platform/lib/js/lexing.js");
var Parser = require("./parser.bs.js");
var Person = require("./person.bs.js");
var Printf = require("bs-platform/lib/js/printf.js");
var $$String = require("bs-platform/lib/js/string.js");
var Wrange = require("./wrange.bs.js");
var Express = require("bs-express/src/Express.js");
var Js_json = require("bs-platform/lib/js/js_json.js");
var Process = require("process");
var Js_primitive = require("bs-platform/lib/js/js_primitive.js");

function make_success(value) {
  var json = { };
  json["status"] = "success";
  json["value"] = value;
  return json;
}

function make_failure(error) {
  var json = { };
  json["status"] = "failure";
  json["error"] = error;
  return json;
}

function make_parsing_failure($staropt$star, lexbuf) {
  var msg = $staropt$star !== undefined ? $staropt$star : "";
  var pos = lexbuf[/* lex_curr_p */11];
  var loc = Curry._3(Printf.sprintf(/* Format */[
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
  return make_failure("Error parsing record:\n" + (String(loc) + (" - " + (String(msg) + ""))));
}

function $great$slash$great(f, g, x) {
  var match = Curry._1(f, x);
  if (match !== undefined) {
    return Curry._1(g, Js_primitive.valFromOption(match));
  }
  
}

function logRequest(next, req) {
  var ip$prime = Express.Request[/* ip */10](req);
  var meth = Express.Request[/* methodRaw */13](req);
  var url = Express.Request[/* path */16](req);
  var match = Express.Request[/* bodyText */5](req);
  var text = match !== undefined ? $$String.concat("", /* :: */[
          ": \"",
          /* :: */[
            match,
            /* :: */[
              "\"",
              /* [] */0
            ]
          ]
        ]) : "";
  console.log("" + (String(ip$prime) + (" ~ " + (String(meth) + (" " + (String(url) + ("" + (String(text) + ""))))))));
  return Curry._1(next, Express.Next[/* middleware */0]);
}

function listPeople(set, _, req) {
  var params = Express.Request[/* params */0](req);
  var match = $great$slash$great((function (param) {
          return Js_primitive.undefined_to_opt(params[param]);
        }), Js_json.decodeString, "key");
  var key = match !== undefined ? match : "Last";
  var match$1 = $great$slash$great((function (param) {
          return Js_primitive.undefined_to_opt(params[param]);
        }), Js_json.decodeString, "order");
  var order = match$1 !== undefined ? match$1 : "Ascending";
  var people = $$Array.map(Person.to_json, Person.array_of_set_str_key(set, key, order));
  var partial_arg = make_success(people);
  var partial_arg$1 = Express.Response[/* sendJson */3];
  var partial_arg$2 = Express.Response[/* status */9](/* Ok */0);
  return (function (param) {
      var param$1 = Curry._1(partial_arg$2, param);
      return partial_arg$1(partial_arg, param$1);
    });
}

function start($staropt$star, set) {
  var port = $staropt$star !== undefined ? $staropt$star : 3000;
  var api = Express.Router[/* make */15](undefined, undefined, undefined, /* () */0);
  Express.Router[/* get */4](api, "/records/:key/:order", Express.Middleware[/* from */5]((function (param, param$1) {
              return listPeople(set, param, param$1);
            })));
  Express.Router[/* get */4](api, "/records/:key", Express.Middleware[/* from */5]((function (param, param$1) {
              return listPeople(set, param, param$1);
            })));
  Express.Router[/* get */4](api, "/records", Express.Middleware[/* from */5]((function (param, param$1) {
              return listPeople(set, param, param$1);
            })));
  Express.Router[/* post */7](api, "/records", Express.Middleware[/* from */5]((function (param, param$1) {
              var set$1 = set;
              var req = param$1;
              var match = Express.Request[/* bodyText */5](req);
              if (match !== undefined) {
                var lexbuf = Lexing.from_string(match);
                try {
                  var people = Wrange.parse_buf_exn(lexbuf);
                  var people$prime = $$Array.map((function (person) {
                          Person.set_add(set$1, person);
                          return Person.to_json(person);
                        }), $$Array.of_list(people));
                  var partial_arg = make_success(people$prime);
                  var partial_arg$1 = Express.Response[/* sendJson */3];
                  var partial_arg$2 = Express.Response[/* status */9](/* Created */1);
                  return (function (param) {
                      var param$1 = Curry._1(partial_arg$2, param);
                      return partial_arg$1(partial_arg, param$1);
                    });
                }
                catch (raw_exn){
                  var exn = Js_exn.internalToOCamlException(raw_exn);
                  if (exn[0] === Lexer.$$SyntaxError) {
                    var partial_arg$3 = make_parsing_failure(exn[1], lexbuf);
                    var partial_arg$4 = Express.Response[/* sendJson */3];
                    var partial_arg$5 = Express.Response[/* status */9](/* BadRequest */19);
                    return (function (param) {
                        var param$1 = Curry._1(partial_arg$5, param);
                        return partial_arg$4(partial_arg$3, param$1);
                      });
                  } else if (exn === Parser.$$Error) {
                    var partial_arg$6 = make_parsing_failure(undefined, lexbuf);
                    var partial_arg$7 = Express.Response[/* sendJson */3];
                    var partial_arg$8 = Express.Response[/* status */9](/* BadRequest */19);
                    return (function (param) {
                        var param$1 = Curry._1(partial_arg$8, param);
                        return partial_arg$7(partial_arg$6, param$1);
                      });
                  } else {
                    throw exn;
                  }
                }
              } else {
                var partial_arg$9 = make_failure("Body required for POST /records");
                var partial_arg$10 = Express.Response[/* sendJson */3];
                var partial_arg$11 = Express.Response[/* status */9](/* BadRequest */19);
                return (function (param) {
                    var param$1 = Curry._1(partial_arg$11, param);
                    return partial_arg$10(partial_arg$9, param$1);
                  });
              }
            })));
  var app = Express.App[/* make */15](/* () */0);
  Express.App[/* use */0](app, Express.Middleware[/* text */1](undefined, undefined, undefined, undefined, /* () */0));
  Express.App[/* use */0](app, Express.Middleware[/* from */5](logRequest));
  Express.App[/* useRouterOnPath */18](app, "/v1", api);
  return Express.App[/* listen */19](app, port, (function (param) {
                var port$1 = port;
                var err = param;
                var exit = 0;
                var val;
                try {
                  val = err;
                  exit = 1;
                }
                catch (raw_exn){
                  var exn = Js_exn.internalToOCamlException(raw_exn);
                  if (exn[0] === Js_exn.$$Error) {
                    console.log(exn[1]);
                    Process.exit(1);
                    return /* () */0;
                  } else {
                    throw exn;
                  }
                }
                if (exit === 1) {
                  console.log("Listening at http://127.0.0.1:" + String(port$1));
                  return /* () */0;
                }
                
              }), /* () */0);
}

exports.start = start;
/* Express Not a pure module */
