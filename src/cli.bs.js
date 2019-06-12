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

var fields = /* :: */[
  /* tuple */[
    "last_name",
    /* Last_name */0
  ],
  /* :: */[
    /* tuple */[
      "first_name",
      /* First_name */1
    ],
    /* :: */[
      /* tuple */[
        "gender",
        /* Gender */2
      ],
      /* :: */[
        /* tuple */[
          "favourite_colour",
          /* Favourite_colour */3
        ],
        /* :: */[
          /* tuple */[
            "birthday",
            /* Birthday */4
          ],
          /* [] */0
        ]
      ]
    ]
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

function print(sep, fields, sorts, files) {
  var set = PersonSet.create(/* () */0);
  List.iter((function (file) {
          var more = PersonSet.of_file_exn(file);
          return PersonSet.add_all(undefined, more, set, /* () */0);
        }), files);
  return $$Array.iter((function (person) {
                console.log(Person.to_string(sep, fields, person));
                return /* () */0;
              }), PersonSet.to_array(set, sorts));
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

var doc = Curry._1(Printf.sprintf(/* Format */[
          /* String_literal */Block.__(11, [
              "Indicate a field-separator to print between selected fields. Defaults to ",
              /* String */Block.__(2, [
                  /* No_padding */0,
                  /* End_of_format */0
                ])
            ]),
          "Indicate a field-separator to print between selected fields. Defaults to %s"
        ]), Cmdliner.Arg[/* doc_quote */43](", "));

var partial_arg$4 = Cmdliner.Arg[/* some */6](undefined, Cmdliner.Arg[/* string */32]);

var partial_arg$5 = Cmdliner.Arg[/* opt */14];

var sep$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* value */20], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$5(undefined, partial_arg$4, undefined, param);
          }), Cmdliner.Arg[/* info */8](undefined, "SEP", doc, undefined, /* :: */[
              "separator",
              /* [] */0
            ])));

var field = Cmdliner.Arg[/* enum */33](fields);

var field_doc = Cmdliner.Arg[/* doc_alts_enum */45](undefined, fields);

var doc$1 = Curry._2(Printf.sprintf(/* Format */[
          /* String_literal */Block.__(11, [
              "Select which fields to include in the sorted output. $(docv) must be a comma-separated list of FIELDs, where each FIELD is ",
              /* String */Block.__(2, [
                  /* No_padding */0,
                  /* String_literal */Block.__(11, [
                      " or a unique prefix thereof. Defaults to printing all fields. e.g. ",
                      /* String */Block.__(2, [
                          /* No_padding */0,
                          /* End_of_format */0
                        ])
                    ])
                ])
            ]),
          "Select which fields to include in the sorted output. $(docv) must be a comma-separated list of FIELDs, where each FIELD is %s or a unique prefix thereof. Defaults to printing all fields. e.g. %s"
        ]), field_doc, Cmdliner.Arg[/* doc_quote */43]("$(i,-f first,last)"));

var partial_arg$6 = Cmdliner.Arg[/* some */6](undefined, Cmdliner.Arg[/* list */37](undefined, field));

var partial_arg$7 = Cmdliner.Arg[/* opt */14];

var fields$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* value */20], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$7(undefined, partial_arg$6, undefined, param);
          }), Cmdliner.Arg[/* info */8](undefined, "FIELDSPEC", doc$1, undefined, /* :: */[
              "f",
              /* :: */[
                "fields",
                /* [] */0
              ]
            ])));

var sort_key = Cmdliner.Arg[/* enum */33](sort_keys);

var sort_key_doc = Cmdliner.Arg[/* doc_alts_enum */45](undefined, sort_keys);

var sort_order = Cmdliner.Arg[/* enum */33](sort_orders);

var sort_order_doc = Cmdliner.Arg[/* doc_alts_enum */45](undefined, sort_orders);

var doc$2 = Curry._4(Printf.sprintf(/* Format */[
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
                                  /* String_literal */Block.__(11, [
                                      ". e.g. ",
                                      /* String */Block.__(2, [
                                          /* No_padding */0,
                                          /* End_of_format */0
                                        ])
                                    ])
                                ])
                            ])
                        ])
                    ])
                ])
            ]),
          "Specify the single sorting constraint $(docv) to apply to the output. May be specified more than once, in which case the sorts are applied lexicographically, in corresponding order. The constraint $(docv) must be specified as a comma-separated pair of %s; where $(b,KEY) is %s, and $(b,ORDER) is %s. e.g. %s"
        ]), Cmdliner.Arg[/* doc_quote */43]("$(b,KEY,ORDER)"), sort_key_doc, sort_order_doc, Cmdliner.Arg[/* doc_quote */43]("$(i,--sort=birth,asc)"));

var partial_arg$8 = Cmdliner.Arg[/* pair */39](undefined, sort_key, sort_order);

var partial_arg$9 = Cmdliner.Arg[/* opt_all */15];

var sorts$prime = Cmdliner.Arg[/* & */9](Cmdliner.Arg[/* value */20], Cmdliner.Arg[/* & */9]((function (param) {
            return partial_arg$9(undefined, partial_arg$8, /* [] */0, param);
          }), Cmdliner.Arg[/* info */8](undefined, "SORTSPEC", doc$2, undefined, /* :: */[
              "sort",
              /* [] */0
            ])));

var print$prime_000 = Cmdliner.Term[/* $ */3](Cmdliner.Term[/* $ */3](Cmdliner.Term[/* $ */3](Cmdliner.Term[/* $ */3](Cmdliner.Term[/* const */0](print), sep$prime), fields$prime), sorts$prime), files$prime);

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
      "a person-record parser, sorter, and server",
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

var sprintf = Printf.sprintf;

exports.sprintf = sprintf;
exports.sort_keys = sort_keys;
exports.sort_orders = sort_orders;
exports.fields = fields;
exports.start = start;
exports.print = print;
exports.files$prime = files$prime;
exports.port$prime = port$prime;
exports.start$prime = start$prime;
exports.sep$prime = sep$prime;
exports.fields$prime = fields$prime;
exports.sorts$prime = sorts$prime;
exports.print$prime = print$prime;
exports.default$prime = default$prime;
/*  Not a pure module */
