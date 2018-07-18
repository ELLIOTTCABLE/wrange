'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.js");
var Person = require("../src/person.bs.js");
var Js_primitive = require("bs-platform/lib/js/js_primitive.js");
var Caml_builtin_exceptions = require("bs-platform/lib/js/caml_builtin_exceptions.js");

function make_birthday_exn(iso8601) {
  var date = new Date(iso8601);
  var flo = date.valueOf();
  if (isNaN(flo)) {
    throw [
          Caml_builtin_exceptions.failure,
          "Unparsable date"
        ];
  } else {
    return date;
  }
}

function make_person($staropt$star, $staropt$star$1, $staropt$star$2, $staropt$star$3, $staropt$star$4, _) {
  var last_name = $staropt$star !== undefined ? $staropt$star : "Wittig";
  var first_name = $staropt$star$1 !== undefined ? $staropt$star$1 : "Kachel";
  var gender = $staropt$star$2 !== undefined ? $staropt$star$2 : /* Female */1;
  var favourite_colour = $staropt$star$3 !== undefined ? $staropt$star$3 : /* Yellow */4;
  var birthday = $staropt$star$4 !== undefined ? Js_primitive.valFromOption($staropt$star$4) : make_birthday_exn("1989-01-25");
  return Person.create(last_name, first_name, gender, favourite_colour, birthday);
}

describe("Data model", (function () {
        describe("Person", (function () {
                Jest.test("can be created", (function () {
                        return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                              return Person.create("Wittig", "Kachel", /* Female */1, /* Yellow */4, make_birthday_exn("1989-01-25"));
                                            }))));
                      }));
                return Jest.test("can produce a string for their birthday", (function () {
                              var person = make_person(undefined, undefined, undefined, undefined, Js_primitive.some(make_birthday_exn("1989-01-25")), /* () */0);
                              return Jest.Expect[/* toBe */2]("1989-01-25", Jest.Expect[/* expect */0](Person.string_of_birthday(person)));
                            }));
              }));
        return /* () */0;
      }));

exports.make_birthday_exn = make_birthday_exn;
exports.make_person = make_person;
/*  Not a pure module */
