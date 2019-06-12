'use strict';

var List = require("bs-platform/lib/js/list.js");
var $$Array = require("bs-platform/lib/js/array.js");
var Block = require("bs-platform/lib/js/block.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Person = require("./person.bs.js");
var Printf = require("bs-platform/lib/js/printf.js");
var Server = require("./server.bs.js");
var Cmdliner = require("@elliottcable/bs-cmdliner/src/cmdliner.bs.js");
var PersonSet = require("./personSet.bs.js");

process.argv.shift()
;

var sort_keys = /* :: */[
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
];

var sort_orders = /* :: */[
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
];

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

var partial_arg = Cmdliner.Arg[/* string */32];

var partial_arg$1 = Cmdliner.Arg[/* pos_all */17];

var files$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* non_empty */22], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$1(partial_arg, /* [] */0, param);
          }), Cmdliner.Arg[/* info */8](undefined, "FILE", "The path to a text-file containing a set of person-records, in a supported format. (See $(b,FORMATS), below.) May be specified multiple times; the records in later files will be merged into the set implied by earlier ones with preference to later entries.", undefined, /* [] */0)));

var partial_arg$2 = Cmdliner.Arg[/* int */27];

var partial_arg$3 = Cmdliner.Arg[/* opt */14];

var port$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* value */20], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$3(undefined, partial_arg$2, 3000, param);
          }), Cmdliner.Arg[/* info */8](undefined, "PORT", "Bind to connections on $(docv).", undefined, /* :: */[
              "p",
              /* :: */[
                "port",
                /* [] */0
              ]
            ])));

var sort_key = Cmdliner.Arg[/* enum */33](sort_keys);

var sort_key_doc = Cmdliner.Arg[/* doc_alts_enum */45](undefined, sort_keys);

var sort_order = Cmdliner.Arg[/* enum */33](sort_orders);

var sort_order_doc = Cmdliner.Arg[/* doc_alts_enum */45](undefined, sort_orders);

var doc = Curry._3(Printf.sprintf(/* Format */[
          /* String_literal */Block.__(11, [
              "Specify the single sorting constraint $(docv) to apply to the output. May be specified more than once, in which case the sorts are applied lexicographically, in corresponding order. The constraint $(docv) must be specified as a comma-separated pair of ",
              /* String */Block.__(2, [
                  /* No_padding */0,
                  /* String_literal */Block.__(11, [
                      "; where $(b,KEY) is ",
                      /* String */Block.__(2, [
                          /* No_padding */0,
                          /* String_literal */Block.__(11, [
                              ", and $(b,ORDER) is ",
                              /* String */Block.__(2, [
                                  /* No_padding */0,
                                  /* Char_literal */Block.__(12, [
                                      /* "." */46,
                                      /* End_of_format */0
                                    ])
                                ])
                            ])
                        ])
                    ])
                ])
            ]),
          "Specify the single sorting constraint $(docv) to apply to the output. May be specified more than once, in which case the sorts are applied lexicographically, in corresponding order. The constraint $(docv) must be specified as a comma-separated pair of %s; where $(b,KEY) is %s, and $(b,ORDER) is %s."
        ]), Cmdliner.Arg[/* doc_quote */43]("$(b,KEY,ORDER)"), sort_key_doc, sort_order_doc);

var partial_arg$4 = Cmdliner.Arg[/* pair */39](undefined, sort_key, sort_order);

var partial_arg$5 = Cmdliner.Arg[/* opt_all */15];

var sorts$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* value */20], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$5(undefined, partial_arg$4, /* [] */0, param);
          }), Cmdliner.Arg[/* info */8](undefined, "SORTSPEC", doc, undefined, /* :: */[
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
      "Start a REST server publishing given person-records",
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
      "Sort, and display, the contents of person-records stored in files",
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

exports.sort_keys = sort_keys;
exports.sort_orders = sort_orders;
exports.start = start;
exports.print = print;
exports.files$prime = files$prime;
exports.port$prime = port$prime;
exports.sorts$prime = sorts$prime;
exports.start$prime = start$prime;
exports.print$prime = print$prime;
exports.default$prime = default$prime;
/*  Not a pure module */
