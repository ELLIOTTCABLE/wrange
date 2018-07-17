'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Express = require("bs-express/src/Express.js");

function makeSuccessJson() {
  var json = { };
  json["success"] = true;
  return json;
}

var app = Express.App[/* make */15](/* () */0);

Express.App[/* get */4](app, "/method", Express.Middleware[/* from */5]((function (next, req) {
            var s = Express.Request[/* httpMethod */14](req);
            if (s !== 0) {
              console.log(s);
              return Curry._1(next, Express.Next[/* route */1]);
            } else {
              var partial_arg = makeSuccessJson(/* () */0);
              var partial_arg$1 = Express.Response[/* sendJson */3];
              return (function (param) {
                  return partial_arg$1(partial_arg, param);
                });
            }
          })));

Express.App[/* listen */19](app, 3000, undefined, /* () */0);

exports.makeSuccessJson = makeSuccessJson;
exports.app = app;
/* app Not a pure module */
