'use strict';

var Hashtbl = require("bs-platform/lib/js/hashtbl.js");
var Caml_array = require("bs-platform/lib/js/caml_array.js");
var Caml_builtin_exceptions = require("bs-platform/lib/js/caml_builtin_exceptions.js");

function string_of_birthday(person) {
  var iso8601 = person[/* birthday */4].toISOString();
  var match = iso8601.split("T");
  if (match.length !== 2) {
    throw [
          Caml_builtin_exceptions.failure,
          "Unreachable"
        ];
  } else {
    return match[0];
  }
}

function nobody() {
  return /* record */[
          /* last_name */"",
          /* first_name */"",
          /* gender : Unspecified */3,
          /* favourite_colour : Black */0,
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

function array_of_set(set, _) {
  var i = /* record */[/* contents */0];
  var arr = Caml_array.caml_make_vect(set[/* size */0], nobody(/* () */0));
  Hashtbl.iter((function (_, person) {
          Caml_array.caml_array_set(arr, i[0], person);
          i[0] = i[0] + 1 | 0;
          return /* () */0;
        }), set);
  return arr;
}

exports.create = create;
exports.of_object = of_object;
exports.to_object = to_object;
exports.set_create = set_create;
exports.set_add = set_add;
exports.set_find_exn = set_find_exn;
exports.array_of_set = array_of_set;
exports.string_of_birthday = string_of_birthday;
/* No side effect */
