'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.js");
var List = require("bs-platform/lib/js/list.js");
var $$Array = require("bs-platform/lib/js/array.js");
var Person = require("../src/person.bs.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");
var Js_primitive = require("bs-platform/lib/js/js_primitive.js");

function make_birthday_exn(iso8601) {
  var date = new Date(iso8601);
  var flo = date.valueOf();
  if (isNaN(flo)) {
    return Pervasives.failwith("Unparsable date");
  } else {
    return date;
  }
}

function make_person($staropt$star, $staropt$star$1, $staropt$star$2, $staropt$star$3, $staropt$star$4, _) {
  var last_name = $staropt$star !== undefined ? $staropt$star : "Wittig";
  var first_name = $staropt$star$1 !== undefined ? $staropt$star$1 : "Kachel";
  var gender = $staropt$star$2 !== undefined ? $staropt$star$2 : /* Female */-322301012;
  var favourite_colour = $staropt$star$3 !== undefined ? $staropt$star$3 : /* Yellow */82908052;
  var birthday = $staropt$star$4 !== undefined ? Js_primitive.valFromOption($staropt$star$4) : make_birthday_exn("1989-01-25");
  return Person.create(last_name, first_name, gender, favourite_colour, birthday);
}

describe("Data model", (function () {
        describe("Person", (function () {
                Jest.test("can be created", (function () {
                        return Jest.Expect[/* toThrow */18](Jest.Expect[/* not_ */23](Jest.Expect[/* expect */0]((function () {
                                              Person.create("Wittig", "Kachel", /* Female */-322301012, /* Yellow */82908052, make_birthday_exn("1989-01-25"));
                                              return /* () */0;
                                            }))));
                      }));
                Jest.test("can produce a string for their birthday", (function () {
                        var person = make_person(undefined, undefined, undefined, undefined, Js_primitive.some(make_birthday_exn("1989-01-25")), /* () */0);
                        return Jest.Expect[/* toBe */2]("1989-01-25", Jest.Expect[/* expect */0](Person.string_of_birthday(person)));
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
                                var a_person = make_person(undefined, undefined, undefined, undefined, Js_primitive.some(make_birthday_exn("1949-03-16")), /* () */0);
                                var another_person = make_person(undefined, undefined, undefined, undefined, Js_primitive.some(make_birthday_exn("1990-12-25")), /* () */0);
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
                                          ], Jest.Expect[/* expect */0]($$Array.map((function (pers) {
                                                      return pers[/* first_name */1];
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
                                          ], Jest.Expect[/* expect */0]($$Array.map((function (pers) {
                                                      return pers[/* first_name */1];
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
                                          ], Jest.Expect[/* expect */0]($$Array.map((function (pers) {
                                                      return pers[/* first_name */1];
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
                                                ], Jest.Expect[/* expect */0]($$Array.map((function (pers) {
                                                            return pers[/* first_name */1];
                                                          }), result)));
                                    }));
                      }));
                return /* () */0;
              }));
        return /* () */0;
      }));

exports.make_birthday_exn = make_birthday_exn;
exports.make_person = make_person;
/*  Not a pure module */
