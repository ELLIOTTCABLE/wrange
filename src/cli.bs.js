'use strict';

var List = require("bs-platform/lib/js/list.js");
var $$Array = require("bs-platform/lib/js/array.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Person = require("./person.bs.js");
var Server = require("./server.bs.js");
var Cmdliner = require("@elliottcable/bs-cmdliner/src/cmdliner.bs.js");
var PersonSet = require("./personSet.bs.js");

process.argv.shift()
;

function start(port, files) {
  var set = PersonSet.create(/* () */0);
  List.iter((function (file) {
          var more = PersonSet.of_file_exn(file);
          return PersonSet.add_all(undefined, more, set, /* () */0);
        }), files);
  Server.start(port, set);
  return /* () */0;
}

function print(sorts, files) {
  var set = PersonSet.create(/* () */0);
  List.iter((function (file) {
          var more = PersonSet.of_file_exn(file);
          return PersonSet.add_all(undefined, more, set, /* () */0);
        }), files);
  var people = PersonSet.to_array(set, sorts);
  return $$Array.iter((function (person) {
                console.log(Person.to_json(person));
                return /* () */0;
              }), people);
}

var sort_key = Cmdliner.Arg[/* enum */33](/* :: */[
      /* tuple */[
        "last",
        /* Last */847656566
      ],
      /* :: */[
        /* tuple */[
          "first",
          /* First */332064784
        ],
        /* :: */[
          /* tuple */[
            "gender",
            /* Gender */-741283999
          ],
          /* :: */[
            /* tuple */[
              "birthday",
              /* Birthday */-243010339
            ],
            /* [] */0
          ]
        ]
      ]
    ]);

var sort_order = Cmdliner.Arg[/* enum */33](/* :: */[
      /* tuple */[
        "ascending",
        /* Ascending */-800424520
      ],
      /* :: */[
        /* tuple */[
          "descending",
          /* Descending */235215128
        ],
        /* [] */0
      ]
    ]);

var partial_arg = Cmdliner.Arg[/* string */32];

var partial_arg$1 = Cmdliner.Arg[/* pos_all */17];

var files$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* non_empty */22], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$1(partial_arg, /* [] */0, param);
          }), Cmdliner.Arg[/* info */8](undefined, "FILE", undefined, undefined, /* [] */0)));

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

var partial_arg$4 = Cmdliner.Arg[/* pair */39](undefined, sort_key, sort_order);

var partial_arg$5 = Cmdliner.Arg[/* opt_all */15];

var sorts$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* value */20], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$5(undefined, partial_arg$4, /* [] */0, param);
          }), Cmdliner.Arg[/* info */8](undefined, "SORTSPEC", "DOCME", undefined, /* :: */[
              "sort",
              /* [] */0
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

var print$prime_000 = Cmdliner.Term[/* $ */3](Cmdliner.Term[/* $ */3](Cmdliner.Term[/* const */0](print), sorts$prime), files$prime);

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

exports.start = start;
exports.print = print;
exports.sort_key = sort_key;
exports.sort_order = sort_order;
exports.files$prime = files$prime;
exports.port$prime = port$prime;
exports.sorts$prime = sorts$prime;
exports.start$prime = start$prime;
exports.print$prime = print$prime;
exports.default$prime = default$prime;
/*  Not a pure module */
