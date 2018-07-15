'use strict';

var Caml_builtin_exceptions = require("bs-platform/lib/js/caml_builtin_exceptions.js");

function of_person() {
  throw [
        Caml_builtin_exceptions.failure,
        "NYI"
      ];
}

var Js = /* module */[/* of_person */of_person];

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
  return create(obj.last_name, obj.first_name, obj.gender, obj.favourite_colour, obj.birthday);
}

var Person = /* module */[
  /* Js */Js,
  /* create */create,
  /* of_object */of_object
];

exports.Person = Person;
/* No side effect */
