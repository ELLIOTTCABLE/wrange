'use strict';

var List = require("bs-platform/lib/js/list.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Server = require("./server.bs.js");
var Cmdliner = require("@elliottcable/bs-cmdliner/src/cmdliner.bs.js");
var PersonSet = require("./personSet.bs.js");

process.argv.shift()
;

function hello() {
  console.log("Hello, world!");
  return /* () */0;
}

function start(port, files) {
  var set = PersonSet.create(/* () */0);
  List.iter((function (file) {
          var more = PersonSet.of_file_exn(file);
          return PersonSet.add_all(undefined, more, set, /* () */0);
        }), files);
  Server.start(port, set);
  return /* () */0;
}

var partial_arg = Cmdliner.Arg[/* string */32];

var partial_arg$1 = Cmdliner.Arg[/* pos_all */17];

var files$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* non_empty */22], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$1(partial_arg, /* [] */0, param);
          }), Cmdliner.Arg[/* info */8](undefined, "FILE", undefined, undefined, /* [] */0)));

var hello$prime = Cmdliner.Term[/* $ */3](Cmdliner.Term[/* const */0](hello), Cmdliner.Term[/* const */0](/* () */0));

var partial_arg$2 = Cmdliner.Arg[/* int */27];

var partial_arg$3 = Cmdliner.Arg[/* opt */14];

var port$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* value */20], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$3(undefined, partial_arg$2, 3000, param);
          }), Cmdliner.Arg[/* info */8](undefined, "PORT", "Provide a REST interface on $(docv)", undefined, /* :: */[
              "p",
              /* :: */[
                "port",
                /* [] */0
              ]
            ])));

var start$prime_000 = Cmdliner.Term[/* $ */3](Cmdliner.Term[/* $ */3](Cmdliner.Term[/* const */0](start), port$prime), files$prime);

var start$prime_001 = Curry.app(Cmdliner.Term[/* info */14], [
      undefined,
      undefined,
      undefined,
      undefined,
      undefined,
      undefined,
      "Start a REST server",
      undefined,
      "start"
    ]);

var start$prime = /* tuple */[
  start$prime_000,
  start$prime_001
];

var print$prime_000 = Cmdliner.Term[/* $ */3](Cmdliner.Term[/* const */0](hello), Cmdliner.Term[/* const */0](/* () */0));

var print$prime_001 = Curry.app(Cmdliner.Term[/* info */14], [
      undefined,
      undefined,
      undefined,
      undefined,
      undefined,
      undefined,
      "Sort, and display, the contents of the given person-records",
      undefined,
      "print"
    ]);

var print$prime = /* tuple */[
  print$prime_000,
  print$prime_001
];

var ret$prime = Cmdliner.Term[/* const */0](/* `Help */[
      803495649,
      /* tuple */[
        /* Pager */-797271261,
        undefined
      ]
    ]);

var default$prime_000 = Cmdliner.Term[/* ret */5](ret$prime);

var default$prime_001 = Curry.app(Cmdliner.Term[/* info */14], [
      undefined,
      undefined,
      undefined,
      undefined,
      undefined,
      undefined,
      "a person-record parser and server",
      "v0.0.1",
      "wrange"
    ]);

var default$prime = /* tuple */[
  default$prime_000,
  default$prime_001
];

var commands_001 = /* :: */[
  print$prime,
  /* [] */0
];

var commands = /* :: */[
  start$prime,
  commands_001
];

Cmdliner.Term[/* eval_choice */17](undefined, undefined, undefined, undefined, undefined, default$prime, commands);

exports.hello = hello;
exports.start = start;
exports.files$prime = files$prime;
exports.hello$prime = hello$prime;
exports.port$prime = port$prime;
exports.start$prime = start$prime;
exports.print$prime = print$prime;
exports.default$prime = default$prime;
/*  Not a pure module */
