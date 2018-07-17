'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.js");
var Person = require("../src/person.bs.js");
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

describe("Data model", (function () {
        describe("Person", (function () {
                return Jest.test("can be created", (function () {
                              var person = Person.create("Wittig", "Kachel", /* Female */1, /* Yellow */4, make_birthday_exn("1989-01-25"));
                              return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                                    return person;
                                                  }))));
                            }));
              }));
        return /* () */0;
      }));

exports.make_birthday_exn = make_birthday_exn;
/*  Not a pure module */
