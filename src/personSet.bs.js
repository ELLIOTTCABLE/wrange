'use strict';

var Fs = require("fs");
var List = require("bs-platform/lib/js/list.js");
var Path = require("path");
var $$Array = require("bs-platform/lib/js/array.js");
var Curry = require("bs-platform/lib/js/curry.js");
var Lexing = require("bs-platform/lib/js/lexing.js");
var Person = require("./person.bs.js");
var $$String = require("bs-platform/lib/js/string.js");
var Wrange = require("./wrange.bs.js");
var Hashtbl = require("bs-platform/lib/js/hashtbl.js");
var Caml_array = require("bs-platform/lib/js/caml_array.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");

function create() {
  return Hashtbl.create(undefined, 100);
}

function add(set, person) {
  var key_000 = person[/* last_name */0];
  var key_001 = person[/* first_name */1];
  var key_002 = Person.iso8601_of_birthday(person);
  var key = /* tuple */[
    key_000,
    key_001,
    key_002
  ];
  return Hashtbl.replace(set, key, person);
}

function of_records_exn(records) {
  var set = Hashtbl.create(undefined, 100);
  var lexbuf = Lexing.from_string(records);
  var people = Wrange.parse_buf_exn(lexbuf);
  List.iter((function (person) {
          return add(set, person);
        }), people);
  return set;
}

function of_file_exn(path) {
  var path$prime = Path.resolve(path, "");
  return of_records_exn(Fs.readFileSync(path$prime, "utf8"));
}

function take_src(src_member, _) {
  return src_member;
}

function add_all($staropt$star, src, dest, _) {
  var on_conflict = $staropt$star !== undefined ? $staropt$star : take_src;
  return Hashtbl.iter((function (k, v) {
                if (Hashtbl.mem(dest, k)) {
                  var existing = Hashtbl.find(dest, k);
                  var replacement = Curry._2(on_conflict, v, existing);
                  return Hashtbl.replace(dest, k, replacement);
                } else {
                  return Hashtbl.add(dest, k, v);
                }
              }), src);
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

function to_array_str_sorts(set, sorts) {
  var sorts$prime = List.map((function (param) {
          var order = param[1];
          var key = param[0];
          var match = Person.sort_keyFromJs($$String.capitalize($$String.lowercase(key)));
          var key$prime = match !== undefined ? match : Pervasives.failwith(" \'" + (String(key) + "\' is not a recognized sort-key. "));
          var match$1 = Person.sort_orderFromJs($$String.capitalize($$String.lowercase(order)));
          var order$prime = match$1 !== undefined ? match$1 : Pervasives.failwith(" \'" + (String(order) + "\' is not a recognized sort-order. "));
          return /* tuple */[
                  key$prime,
                  order$prime
                ];
        }), sorts);
  return to_array(set, sorts$prime);
}

var length = Hashtbl.length;

exports.create = create;
exports.of_records_exn = of_records_exn;
exports.of_file_exn = of_file_exn;
exports.add = add;
exports.add_all = add_all;
exports.length = length;
exports.find_exn = find_exn;
exports.to_array = to_array;
exports.to_array_str_sorts = to_array_str_sorts;
/* fs Not a pure module */
