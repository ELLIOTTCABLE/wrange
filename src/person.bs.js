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

exports.create = create;
exports.of_object = of_object;
/* No side effect */
