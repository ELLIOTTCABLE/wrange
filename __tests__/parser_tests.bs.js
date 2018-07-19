'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.js");
var List = require("bs-platform/lib/js/list.js");
var Person = require("../src/person.bs.js");
var Wrange = require("../src/wrange.bs.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");

describe("Parsing", (function () {
        Jest.test("handles an empty document", (function () {
                return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                      return Wrange.parse_print_errors("");
                                    }))));
              }));
        Jest.test("returns an empty list for an empty document", (function () {
                return Jest.Expect[/* toBe */2](/* [] */0, Jest.Expect[/* expect */0](Wrange.parse_print_errors("")));
              }));
        Jest.test("recognizes a single record with a terminating newline", (function () {
                var results = Wrange.parse_print_errors("Wittig|Kachel|Female|Yellow|1989-01-25\n");
                return Jest.Expect[/* toBe */2](1, Jest.Expect[/* expect */0](List.length(results)));
              }));
        Jest.test("recognizes a single record with no terminator", (function () {
                var results = Wrange.parse_print_errors("Wittig|Kachel|Female|Yellow|1989-01-25");
                return Jest.Expect[/* toBe */2](1, Jest.Expect[/* expect */0](List.length(results)));
              }));
        it.skip("recognizes a single record with prefixing whitespace", (function () {
                var results = Wrange.parse_print_errors("  Wittig|Kachel|Female|Yellow|1989-01-25");
                return Jest.Expect[/* toBe */2](1, Jest.Expect[/* expect */0](List.length(results)));
              }));
        Jest.test("recognizes a single record with whitespace preceding the EOF", (function () {
                var results = Wrange.parse_print_errors("Wittig|Kachel|Female|Yellow|1989-01-25  ");
                return Jest.Expect[/* toBe */2](1, Jest.Expect[/* expect */0](List.length(results)));
              }));
        Jest.test("parses a single record, with spacing", (function () {
                var match = Wrange.parse_print_errors("Wittig | Kachel | female | yellow | 1989-01-25");
                if (match && !match[1]) {
                  return Jest.Expect[/* toEqual */12](/* record */[
                              /* last_name */"Wittig",
                              /* first_name */"Kachel",
                              /* gender : Female */-322301012,
                              /* favourite_colour : Yellow */82908052,
                              /* birthday */Person.birthday_of_string_exn("1989-01-25")
                            ], Jest.Expect[/* expect */0](match[0]));
                } else {
                  return Pervasives.failwith("see previous test");
                }
              }));
        Jest.test("recognizes multiple spaced, terminated records", (function () {
                var results = Wrange.parse_print_errors("Awesomedottir,  Kelly,   Female,  Yellow,  1989-01-01\n                    Awesomedottir,  Andy,    Male,    Red,     1989-01-01\n                    Awesomedottir,  Ranger,  Female,  Black,   2012-01-01\n      ");
                return Jest.Expect[/* toBe */2](3, Jest.Expect[/* expect */0](List.length(results)));
              }));
        return Jest.test("parses multiple spaced, terminated records", (function () {
                      var results = Wrange.parse_print_errors("Awesomedottir,  Kelly,   Female,  Yellow,  1989-01-01\n                    Awesomedottir,  Andy,    Male,    Red,     1989-01-01\n                    Awesomedottir,  Ranger,  Female,  Black,   2012-01-01\n      ");
                      var results$prime = List.map((function (p) {
                              return p[/* first_name */1];
                            }), results);
                      return Jest.Expect[/* toEqual */12](/* :: */[
                                  "Ranger",
                                  /* :: */[
                                    "Andy",
                                    /* :: */[
                                      "Kelly",
                                      /* [] */0
                                    ]
                                  ]
                                ], Jest.Expect[/* expect */0](results$prime));
                    }));
      }));

/*  Not a pure module */
