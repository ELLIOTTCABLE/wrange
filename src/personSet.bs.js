'use strict';

var List = require("bs-platform/lib/js/list.js");
var $$Array = require("bs-platform/lib/js/array.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Person = require("./person.bs.js");
var $$String = require("bs-platform/lib/js/string.js");
var Hashtbl = require("bs-platform/lib/js/hashtbl.js");
var Caml_array = require("bs-platform/lib/js/caml_array.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");
var Js_mapperRt = require("bs-platform/lib/js/js_mapperRt.js");

var jsMapperConstantArray = /* array */[
  /* tuple */[
    -741283999,
    "Gender"
  ],
  /* tuple */[
    -243010339,
    "Birthday"
  ],
  /* tuple */[
    332064784,
    "First"
  ],
  /* tuple */[
    847656566,
    "Last"
  ]
];

var jsMapperConstantArray$1 = /* array */[
  /* tuple */[
    -800424520,
    "Ascending"
  ],
  /* tuple */[
    235215128,
    "Descending"
  ]
];

function create() {
  return Hashtbl.create(undefined, 100);
}

function add(set, person) {
  var key_000 = person[/* last_name */0];
  var key_001 = person[/* first_name */1];
  var key_002 = Person.string_of_birthday(person);
  var key = /* tuple */[
    key_000,
    key_001,
    key_002
  ];
  return Hashtbl.replace(set, key, person);
}

function find_exn(set, last, first, birthday) {
  return Hashtbl.find(set, /* tuple */[
              last,
              first,
              birthday
            ]);
}

function to_array(set, sorts) {
  var i = /* record */[/* contents */0];
  var arr = Caml_array.caml_make_vect(Hashtbl.length(set), Person.nobody(/* () */0));
  Hashtbl.iter((function (_, person) {
          Caml_array.caml_array_set(arr, i[0], person);
          i[0] = i[0] + 1 | 0;
          return /* () */0;
        }), set);
  List.iteri((function (param, param$1) {
          var arr$1 = arr;
          var i = param;
          var param$2 = param$1;
          var key = param$2[0];
          var sort = i === 0 ? $$Array.fast_sort : $$Array.stable_sort;
          var compare = param$2[1] >= 235215128 ? (function (a, b) {
                return -Person.compare(key, a, b) | 0;
              }) : (function (param, param$1) {
                return Person.compare(key, param, param$1);
              });
          return Curry._2(sort, compare, arr$1);
        }), List.rev(sorts));
  return arr;
}

function to_array_str_key(set, key, order) {
  var param = $$String.capitalize($$String.lowercase(key));
  var match = Js_mapperRt.revSearch(4, jsMapperConstantArray, param);
  var key$prime = match !== undefined ? match : Pervasives.failwith(" \'" + (String(key) + "\' is not a recognized sort-key. "));
  var param$1 = $$String.capitalize($$String.lowercase(order));
  var match$1 = Js_mapperRt.revSearch(2, jsMapperConstantArray$1, param$1);
  var order$prime = match$1 !== undefined ? match$1 : Pervasives.failwith(" \'" + (String(order) + "\' is not a recognized sort-order. "));
  return to_array(set, /* :: */[
              /* tuple */[
                key$prime,
                order$prime
              ],
              /* [] */0
            ]);
}

var length = Hashtbl.length;

exports.create = create;
exports.add = add;
exports.length = length;
exports.find_exn = find_exn;
exports.to_array = to_array;
exports.to_array_str_key = to_array_str_key;
/* No side effect */