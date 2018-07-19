'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.js");
var List = require("bs-platform/lib/js/list.js");
var $$Array = require("bs-platform/lib/js/array.js");
var Person = require("../src/person.bs.js");
var Js_primitive = require("bs-platform/lib/js/js_primitive.js");

function make_person($staropt$star, $staropt$star$1, $staropt$star$2, $staropt$star$3, $staropt$star$4, _) {
  var last_name = $staropt$star !== undefined ? $staropt$star : "Wittig";
  var first_name = $staropt$star$1 !== undefined ? $staropt$star$1 : "Kachel";
  var gender = $staropt$star$2 !== undefined ? $staropt$star$2 : /* Female */-322301012;
  var favourite_colour = $staropt$star$3 !== undefined ? $staropt$star$3 : /* Yellow */82908052;
  var birthday = $staropt$star$4 !== undefined ? Js_primitive.valFromOption($staropt$star$4) : Person.birthday_of_string_exn("1989-01-25");
  return Person.create(last_name, first_name, gender, favourite_colour, birthday);
}

describe("Data model", (function () {
        describe("Person", (function () {
                Jest.test("can be created", (function () {
                        return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                              Person.create("Wittig", "Kachel", /* Female */-322301012, /* Yellow */82908052, Person.birthday_of_string_exn("1989-01-25"));
                                              return /* () */0;
                                            }))));
                      }));
                Jest.test("can produce a string for their birthday", (function () {
                        var person = make_person(undefined, undefined, undefined, undefined, Js_primitive.some(Person.birthday_of_string_exn("1989-01-25")), /* () */0);
                        return Jest.Expect[/* toBe */2]("1989-01-25", Jest.Expect[/* expect */0](Person.string_of_birthday(person)));
                      }));
                Jest.test("can parse a date-string as a convenience", (function () {
                        return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                              return Person.birthday_of_string_exn("1989-01-25");
                                            }))));
                      }));
                Jest.test("round-trips a string-ish birthday", (function () {
                        var str = "1989-01-25";
                        var date = Person.birthday_of_string_exn(str);
                        var person = make_person(undefined, undefined, undefined, undefined, Js_primitive.some(date), /* () */0);
                        return Jest.Expect[/* toBe */2](str, Jest.Expect[/* expect */0](Person.string_of_birthday(person)));
                      }));
                Jest.test("throws on a non-date birthday", (function () {
                        return Jest.Expect[/* toThrow */18](Jest.Expect[/* expect */0]((function () {
                                          return Person.birthday_of_string_exn("this is not a birthday");
                                        })));
                      }));
                describe("Record validation", (function () {
                        Jest.test("accepts a well-formed description", (function () {
                                return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                                      return Person.of_string_description("Wittig", "Kachel", "Female", "Yellow", "1989-01-25");
                                                    }))));
                              }));
                        return Jest.test("accepts mis-cased variant tags", (function () {
                                      var p = Person.of_string_description("Wittig", "Kachel", "feMAlE", "yElLOW", "1989-01-25");
                                      return Jest.Expect[/* toEqual */12](/* tuple */[
                                                  "Wittig",
                                                  "Kachel",
                                                  /* Female */-322301012,
                                                  /* Yellow */82908052,
                                                  "1989-01-25"
                                                ], Jest.Expect[/* expect */0](/* tuple */[
                                                      p[/* last_name */0],
                                                      p[/* first_name */1],
                                                      p[/* gender */2],
                                                      p[/* favourite_colour */3],
                                                      Person.string_of_birthday(p)
                                                    ]));
                                    }));
                      }));
                describe("Set of people", (function () {
                        Jest.test("can be created, empty", (function () {
                                return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                                      return Person.set_create(/* () */0);
                                                    }))));
                              }));
                        Jest.test("can be added to", (function () {
                                var set = Person.set_create(/* () */0);
                                var person = make_person(undefined, undefined, undefined, undefined, undefined, /* () */0);
                                return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                                      return Person.set_add(set, person);
                                                    }))));
                              }));
                        Jest.test("can be retrieved from", (function () {
                                var set = Person.set_create(/* () */0);
                                var person = make_person(undefined, undefined, undefined, undefined, undefined, /* () */0);
                                Person.set_add(set, person);
                                var result = Person.set_find_exn(set, person[/* last_name */0], person[/* first_name */1], Person.string_of_birthday(person));
                                return Jest.Expect[/* toBe */2](person, Jest.Expect[/* expect */0](result));
                              }));
                        Jest.test("retrieves the correct person, even with an overloaded name", (function () {
                                var set = Person.set_create(/* () */0);
                                var a_person = make_person(undefined, undefined, undefined, undefined, Js_primitive.some(Person.birthday_of_string_exn("1949-03-16")), /* () */0);
                                var another_person = make_person(undefined, undefined, undefined, undefined, Js_primitive.some(Person.birthday_of_string_exn("1990-12-25")), /* () */0);
                                Person.set_add(set, a_person);
                                Person.set_add(set, another_person);
                                var result = Person.set_find_exn(set, a_person[/* last_name */0], a_person[/* first_name */1], Person.string_of_birthday(a_person));
                                return Jest.Expect[/* toBe */2](a_person, Jest.Expect[/* expect */0](result));
                              }));
                        Jest.test("can be folded into a array", (function () {
                                var set = Person.set_create(/* () */0);
                                var a_person = make_person(undefined, "Kelly", undefined, undefined, undefined, /* () */0);
                                var another_person = make_person(undefined, "Andy", undefined, undefined, undefined, /* () */0);
                                Person.set_add(set, a_person);
                                Person.set_add(set, another_person);
                                var result = Person.array_of_set(set, /* [] */0);
                                return Jest.Expect[/* toBe */2](2, Jest.Expect[/* expect */0](result.length));
                              }));
                        Jest.test("can be sorted by name", (function () {
                                var set = Person.set_create(/* () */0);
                                var a_person = make_person(undefined, "Kelly", undefined, undefined, undefined, /* () */0);
                                var another_person = make_person(undefined, "Andy", undefined, undefined, undefined, /* () */0);
                                var last_person = make_person(undefined, "Ranger", undefined, undefined, undefined, /* () */0);
                                Person.set_add(set, a_person);
                                Person.set_add(set, another_person);
                                Person.set_add(set, last_person);
                                var result = Person.array_of_set(set, /* :: */[
                                      /* tuple */[
                                        /* First */1,
                                        /* Ascending */0
                                      ],
                                      /* [] */0
                                    ]);
                                return Jest.Expect[/* toEqual */12](/* array */[
                                            "Andy",
                                            "Kelly",
                                            "Ranger"
                                          ], Jest.Expect[/* expect */0]($$Array.map((function (p) {
                                                      return p[/* first_name */1];
                                                    }), result)));
                              }));
                        Jest.test("can be sorted in inverted order", (function () {
                                var set = Person.set_create(/* () */0);
                                var a_person = make_person(undefined, "Kelly", undefined, undefined, undefined, /* () */0);
                                var another_person = make_person(undefined, "Andy", undefined, undefined, undefined, /* () */0);
                                var last_person = make_person(undefined, "Ranger", undefined, undefined, undefined, /* () */0);
                                Person.set_add(set, a_person);
                                Person.set_add(set, another_person);
                                Person.set_add(set, last_person);
                                var result = Person.array_of_set(set, /* :: */[
                                      /* tuple */[
                                        /* First */1,
                                        /* Descending */1
                                      ],
                                      /* [] */0
                                    ]);
                                return Jest.Expect[/* toEqual */12](/* array */[
                                            "Ranger",
                                            "Kelly",
                                            "Andy"
                                          ], Jest.Expect[/* expect */0]($$Array.map((function (p) {
                                                      return p[/* first_name */1];
                                                    }), result)));
                              }));
                        Jest.test("accepts multiple keys to sort by, and ignores extraneous ones", (function () {
                                var set = Person.set_create(/* () */0);
                                var a_person = make_person(undefined, "Kelly", undefined, undefined, undefined, /* () */0);
                                var another_person = make_person(undefined, "Andy", undefined, undefined, undefined, /* () */0);
                                var last_person = make_person(undefined, "Ranger", undefined, undefined, undefined, /* () */0);
                                Person.set_add(set, a_person);
                                Person.set_add(set, another_person);
                                Person.set_add(set, last_person);
                                var result = Person.array_of_set(set, /* :: */[
                                      /* tuple */[
                                        /* First */1,
                                        /* Ascending */0
                                      ],
                                      /* :: */[
                                        /* tuple */[
                                          /* Last */0,
                                          /* Ascending */0
                                        ],
                                        /* [] */0
                                      ]
                                    ]);
                                return Jest.Expect[/* toEqual */12](/* array */[
                                            "Andy",
                                            "Kelly",
                                            "Ranger"
                                          ], Jest.Expect[/* expect */0]($$Array.map((function (p) {
                                                      return p[/* first_name */1];
                                                    }), result)));
                              }));
                        return Jest.test("sorts lexicographically by secondary keys in the case of conflicts", (function () {
                                      var set = Person.set_create(/* () */0);
                                      List.iter((function (param) {
                                              return Person.set_add(set, param);
                                            }), /* :: */[
                                            make_person("Wittig", "Kachel", undefined, undefined, undefined, /* () */0),
                                            /* :: */[
                                              make_person("Awesomedottir", "Kelly", undefined, undefined, undefined, /* () */0),
                                              /* :: */[
                                                make_person("Awesomedottir", "Andy", undefined, undefined, undefined, /* () */0),
                                                /* :: */[
                                                  make_person("Awesomedottir", "Ranger", undefined, undefined, undefined, /* () */0),
                                                  /* [] */0
                                                ]
                                              ]
                                            ]
                                          ]);
                                      var result = Person.array_of_set(set, /* :: */[
                                            /* tuple */[
                                              /* Last */0,
                                              /* Ascending */0
                                            ],
                                            /* :: */[
                                              /* tuple */[
                                                /* First */1,
                                                /* Ascending */0
                                              ],
                                              /* [] */0
                                            ]
                                          ]);
                                      return Jest.Expect[/* toEqual */12](/* array */[
                                                  "Andy",
                                                  "Kelly",
                                                  "Ranger",
                                                  "Kachel"
                                                ], Jest.Expect[/* expect */0]($$Array.map((function (p) {
                                                            return p[/* first_name */1];
                                                          }), result)));
                                    }));
                      }));
                return /* () */0;
              }));
        return /* () */0;
      }));

var make_birthday = Person.birthday_of_string_exn;

exports.make_birthday = make_birthday;
exports.make_person = make_person;
/*  Not a pure module */