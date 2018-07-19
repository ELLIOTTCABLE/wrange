'use strict';

var List = require("bs-platform/lib/js/list.js");
var $$Array = require("bs-platform/lib/js/array.js");
var Curry = require("bs-platform/lib/js/curry.js");
var $$String = require("bs-platform/lib/js/string.js");
var Hashtbl = require("bs-platform/lib/js/hashtbl.js");
var Js_json = require("bs-platform/lib/js/js_json.js");
var Js_option = require("bs-platform/lib/js/js_option.js");
var Caml_array = require("bs-platform/lib/js/caml_array.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");
var Js_mapperRt = require("bs-platform/lib/js/js_mapperRt.js");
var Js_primitive = require("bs-platform/lib/js/js_primitive.js");
var Caml_primitive = require("bs-platform/lib/js/caml_primitive.js");

var jsMapperConstantArray = /* array */[
  /* tuple */[
    -811299821,
    "Neither"
  ],
  /* tuple */[
    -394757225,
    "Unspecified"
  ],
  /* tuple */[
    -322301012,
    "Female"
  ],
  /* tuple */[
    858744557,
    "Male"
  ]
];

var jsMapperConstantArray$1 = /* array */[
  /* tuple */[
    -937474657,
    "Black"
  ],
  /* tuple */[
    -930446478,
    "Indigo"
  ],
  /* tuple */[
    -588596599,
    "White"
  ],
  /* tuple */[
    -95344882,
    "Orange"
  ],
  /* tuple */[
    4100401,
    "Red"
  ],
  /* tuple */[
    82908052,
    "Yellow"
  ],
  /* tuple */[
    561310623,
    "Violet"
  ],
  /* tuple */[
    737308346,
    "Blue"
  ],
  /* tuple */[
    756711075,
    "Green"
  ]
];

function string_of_birthday(person) {
  var iso8601 = person[/* birthday */4].toISOString();
  var match = iso8601.split("T");
  if (match.length !== 2) {
    return Pervasives.failwith("Unreachable");
  } else {
    return match[0];
  }
}

function birthday_of_string_exn(iso8601) {
  var date = new Date(iso8601);
  var flo = date.valueOf();
  if (isNaN(flo)) {
    return Pervasives.failwith("Unparsable date");
  } else {
    return date;
  }
}

function nobody() {
  return /* record */[
          /* last_name */"",
          /* first_name */"",
          /* gender : Unspecified */-394757225,
          /* favourite_colour : Black */-937474657,
          /* birthday */new Date()
        ];
}

function create(last_name, first_name, gender, favourite_colour, birthday) {
  return /* record */[
          /* last_name */last_name,
          /* first_name */first_name,
          /* gender */gender,
          /* favourite_colour */favourite_colour,
          /* birthday */birthday
        ];
}

function of_string_description(last_name, first_name, gender, favourite_colour, birthday) {
  if (last_name === "") {
    return Pervasives.failwith("last_name cannot be empty");
  } else if (first_name === "") {
    return Pervasives.failwith("first_name cannot be empty");
  } else {
    var param = $$String.capitalize($$String.lowercase(gender));
    var match = Js_mapperRt.revSearch(4, jsMapperConstantArray, param);
    var gender$prime = match !== undefined ? match : Pervasives.failwith(" \'" + (String(gender) + "\' is not a recognized gender. good job! "));
    var param$1 = $$String.capitalize($$String.lowercase(favourite_colour));
    var match$1 = Js_mapperRt.revSearch(9, jsMapperConstantArray$1, param$1);
    var favourite_colour$prime = match$1 !== undefined ? match$1 : Pervasives.failwith(" \'" + (String(favourite_colour) + "\' is not a recognized colour. good job! "));
    var birthday$prime = birthday_of_string_exn(birthday);
    return /* record */[
            /* last_name */last_name,
            /* first_name */first_name,
            /* gender */gender$prime,
            /* favourite_colour */favourite_colour$prime,
            /* birthday */birthday$prime
          ];
  }
}

function of_object(obj) {
  var param = obj;
  return /* record */[
          /* last_name */param.last_name,
          /* first_name */param.first_name,
          /* gender */param.gender,
          /* favourite_colour */param.favourite_colour,
          /* birthday */param.birthday
        ];
}

function to_object(p) {
  var param = p;
  return {
          last_name: param[/* last_name */0],
          first_name: param[/* first_name */1],
          gender: param[/* gender */2],
          favourite_colour: param[/* favourite_colour */3],
          birthday: param[/* birthday */4]
        };
}

function compare(key, a, b) {
  if (key >= 332064784) {
    if (key >= 847656566) {
      return $$String.compare(a[/* last_name */0], b[/* last_name */0]);
    } else {
      return $$String.compare(a[/* first_name */1], b[/* first_name */1]);
    }
  } else if (key >= -243010339) {
    return Caml_primitive.caml_float_compare(a[/* birthday */4].valueOf(), b[/* birthday */4].valueOf());
  } else {
    return Caml_primitive.caml_int_compare(a[/* gender */2], b[/* gender */2]);
  }
}

function of_json_exn(json) {
  var d = Js_option.getExn(Js_json.decodeObject(json));
  var last_name = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["last_name"]))));
  var first_name = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["first_name"]))));
  var gender = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["gender"]))));
  var favourite_colour = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["favourite_colour"]))));
  var birthday = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["birthday"]))));
  return of_string_description(last_name, first_name, gender, favourite_colour, birthday);
}

function to_json(person) {
  var json = { };
  json["last_name"] = person[/* last_name */0];
  json["first_name"] = person[/* first_name */1];
  json["gender"] = Js_mapperRt.binarySearch(4, person[/* gender */2], jsMapperConstantArray);
  json["favourite_colour"] = Js_mapperRt.binarySearch(9, person[/* favourite_colour */3], jsMapperConstantArray$1);
  json["birthday"] = person[/* birthday */4].toJSON();
  return json;
}

function set_create() {
  return Hashtbl.create(undefined, 100);
}

function set_add(set, person) {
  var key_000 = person[/* last_name */0];
  var key_001 = person[/* first_name */1];
  var key_002 = string_of_birthday(person);
  var key = /* tuple */[
    key_000,
    key_001,
    key_002
  ];
  return Hashtbl.replace(set, key, person);
}

function set_find_exn(set, last, first, birthday) {
  return Hashtbl.find(set, /* tuple */[
              last,
              first,
              birthday
            ]);
}

function array_of_set(set, sorts) {
  var i = /* record */[/* contents */0];
  var arr = Caml_array.caml_make_vect(Hashtbl.length(set), nobody(/* () */0));
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
          var compare$1 = param$2[1] >= 235215128 ? (function (a, b) {
                return -compare(key, a, b) | 0;
              }) : (function (param, param$1) {
                return compare(key, param, param$1);
              });
          return Curry._2(sort, compare$1, arr$1);
        }), List.rev(sorts));
  return arr;
}

exports.create = create;
exports.of_string_description = of_string_description;
exports.of_object = of_object;
exports.to_object = to_object;
exports.of_json_exn = of_json_exn;
exports.to_json = to_json;
exports.set_create = set_create;
exports.set_add = set_add;
exports.set_find_exn = set_find_exn;
exports.array_of_set = array_of_set;
exports.string_of_birthday = string_of_birthday;
exports.birthday_of_string_exn = birthday_of_string_exn;
/* No side effect */
