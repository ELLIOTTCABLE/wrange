'use strict';

var List = require("bs-platform/lib/js/list.js");
var $$String = require("bs-platform/lib/js/string.js");
var Js_json = require("bs-platform/lib/js/js_json.js");
var Js_math = require("bs-platform/lib/js/js_math.js");
var Js_option = require("bs-platform/lib/js/js_option.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");
var Js_mapperRt = require("bs-platform/lib/js/js_mapperRt.js");
var Js_primitive = require("bs-platform/lib/js/js_primitive.js");
var Caml_primitive = require("bs-platform/lib/js/caml_primitive.js");

var jsMapperConstantArray = /* array */[
  /* tuple */[
    -741283999,
    "Gender"
  ],
  /* tuple */[
    -243010339,
    "Birthday"
  ],
  /* tuple */[
    332064784,
    "First"
  ],
  /* tuple */[
    847656566,
    "Last"
  ]
];

function sort_keyToJs(param) {
  return Js_mapperRt.binarySearch(4, param, jsMapperConstantArray);
}

function sort_keyFromJs(param) {
  return Js_mapperRt.revSearch(4, jsMapperConstantArray, param);
}

var jsMapperConstantArray$1 = /* array */[
  /* tuple */[
    -800424520,
    "Ascending"
  ],
  /* tuple */[
    235215128,
    "Descending"
  ]
];

function sort_orderToJs(param) {
  return Js_mapperRt.binarySearch(2, param, jsMapperConstantArray$1);
}

function sort_orderFromJs(param) {
  return Js_mapperRt.revSearch(2, jsMapperConstantArray$1, param);
}

var jsMapperConstantArray$2 = /* array */[
  /* tuple */[
    -811299821,
    "Neither"
  ],
  /* tuple */[
    -394757225,
    "Unspecified"
  ],
  /* tuple */[
    -322301012,
    "Female"
  ],
  /* tuple */[
    858744557,
    "Male"
  ]
];

var jsMapperConstantArray$3 = /* array */[
  /* tuple */[
    -937474657,
    "Black"
  ],
  /* tuple */[
    -930446478,
    "Indigo"
  ],
  /* tuple */[
    -588596599,
    "White"
  ],
  /* tuple */[
    -95344882,
    "Orange"
  ],
  /* tuple */[
    4100401,
    "Red"
  ],
  /* tuple */[
    82908052,
    "Yellow"
  ],
  /* tuple */[
    561310623,
    "Violet"
  ],
  /* tuple */[
    737308346,
    "Blue"
  ],
  /* tuple */[
    756711075,
    "Green"
  ]
];

function iso8601_of_birthday(person) {
  var iso8601 = person[/* birthday */4].toISOString();
  var match = iso8601.split("T");
  if (match.length !== 2) {
    return Pervasives.failwith("Unreachable");
  } else {
    return match[0];
  }
}

function american_date_of_birthday(person) {
  var mm = person[/* birthday */4].getUTCMonth() + 1;
  var dd = person[/* birthday */4].getUTCDate();
  var yyyy = person[/* birthday */4].getUTCFullYear();
  return $$String.concat("/", List.map((function (prim) {
                    return String(prim);
                  }), List.map(Js_math.floor, /* :: */[
                      mm,
                      /* :: */[
                        dd,
                        /* :: */[
                          yyyy,
                          /* [] */0
                        ]
                      ]
                    ])));
}

function birthday_of_string_exn(iso8601) {
  var date = new Date(iso8601);
  var flo = date.valueOf();
  if (isNaN(flo)) {
    return Pervasives.failwith("Unparsable date");
  } else {
    return date;
  }
}

function nobody() {
  return /* record */[
          /* last_name */"",
          /* first_name */"",
          /* gender : Unspecified */-394757225,
          /* favourite_colour : Black */-937474657,
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

function of_string_description(last_name, first_name, gender, favourite_colour, birthday) {
  if (last_name === "") {
    return Pervasives.failwith("last_name cannot be empty");
  } else if (first_name === "") {
    return Pervasives.failwith("first_name cannot be empty");
  } else {
    var param = $$String.capitalize($$String.lowercase(gender));
    var match = Js_mapperRt.revSearch(4, jsMapperConstantArray$2, param);
    var gender$prime = match !== undefined ? match : Pervasives.failwith(" \'" + (String(gender) + "\' is not a recognized gender. good job! "));
    var param$1 = $$String.capitalize($$String.lowercase(favourite_colour));
    var match$1 = Js_mapperRt.revSearch(9, jsMapperConstantArray$3, param$1);
    var favourite_colour$prime = match$1 !== undefined ? match$1 : Pervasives.failwith(" \'" + (String(favourite_colour) + "\' is not a recognized colour. good job! "));
    var birthday$prime = birthday_of_string_exn(birthday);
    return /* record */[
            /* last_name */last_name,
            /* first_name */first_name,
            /* gender */gender$prime,
            /* favourite_colour */favourite_colour$prime,
            /* birthday */birthday$prime
          ];
  }
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

function to_string($staropt$star, $staropt$star$1, p) {
  var sep = $staropt$star !== undefined ? $staropt$star : ", ";
  var fields = $staropt$star$1 !== undefined ? $staropt$star$1 : /* :: */[
      /* Last_name */0,
      /* :: */[
        /* First_name */1,
        /* :: */[
          /* Gender */2,
          /* :: */[
            /* Favourite_colour */3,
            /* :: */[
              /* Birthday */4,
              /* [] */0
            ]
          ]
        ]
      ]
    ];
  return $$String.concat(sep, List.map((function (param) {
                    var p$1 = p;
                    var param$1 = param;
                    switch (param$1) {
                      case 0 : 
                          return p$1[/* last_name */0];
                      case 1 : 
                          return p$1[/* first_name */1];
                      case 2 : 
                          return Js_mapperRt.binarySearch(4, p$1[/* gender */2], jsMapperConstantArray$2);
                      case 3 : 
                          return Js_mapperRt.binarySearch(9, p$1[/* favourite_colour */3], jsMapperConstantArray$3);
                      case 4 : 
                          return american_date_of_birthday(p$1);
                      
                    }
                  }), fields));
}

function compare(key, a, b) {
  if (key >= 332064784) {
    if (key >= 847656566) {
      return $$String.compare(a[/* last_name */0], b[/* last_name */0]);
    } else {
      return $$String.compare(a[/* first_name */1], b[/* first_name */1]);
    }
  } else if (key >= -243010339) {
    return Caml_primitive.caml_float_compare(a[/* birthday */4].valueOf(), b[/* birthday */4].valueOf());
  } else {
    return Caml_primitive.caml_int_compare(a[/* gender */2], b[/* gender */2]);
  }
}

function of_json_exn(json) {
  var d = Js_option.getExn(Js_json.decodeObject(json));
  var last_name = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["last_name"]))));
  var first_name = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["first_name"]))));
  var gender = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["gender"]))));
  var favourite_colour = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["favourite_colour"]))));
  var birthday = Js_option.getExn(Js_json.decodeString(Js_option.getExn(Js_primitive.undefined_to_opt(d["birthday"]))));
  return of_string_description(last_name, first_name, gender, favourite_colour, birthday);
}

function to_json(person) {
  var json = { };
  json["last_name"] = person[/* last_name */0];
  json["first_name"] = person[/* first_name */1];
  json["gender"] = Js_mapperRt.binarySearch(4, person[/* gender */2], jsMapperConstantArray$2);
  json["favourite_colour"] = Js_mapperRt.binarySearch(9, person[/* favourite_colour */3], jsMapperConstantArray$3);
  json["birthday"] = person[/* birthday */4].toJSON();
  return json;
}

exports.sort_keyToJs = sort_keyToJs;
exports.sort_keyFromJs = sort_keyFromJs;
exports.sort_orderToJs = sort_orderToJs;
exports.sort_orderFromJs = sort_orderFromJs;
exports.create = create;
exports.of_string_description = of_string_description;
exports.of_object = of_object;
exports.to_object = to_object;
exports.of_json_exn = of_json_exn;
exports.to_json = to_json;
exports.to_string = to_string;
exports.nobody = nobody;
exports.compare = compare;
exports.iso8601_of_birthday = iso8601_of_birthday;
exports.american_date_of_birthday = american_date_of_birthday;
exports.birthday_of_string_exn = birthday_of_string_exn;
/* No side effect */
