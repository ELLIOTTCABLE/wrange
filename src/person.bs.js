'use strict';


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

exports.create = create;
exports.of_object = of_object;
exports.to_object = to_object;
/* No side effect */
