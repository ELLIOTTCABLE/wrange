'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Js_exn = require("bs-platform/lib/js/js_exn.js");
var $$String = require("bs-platform/lib/js/string.js");
var Express = require("bs-express/src/Express.js");
var Js_json = require("bs-platform/lib/js/js_json.js");
var Process = require("process");

function make_success() {
  var json = { };
  json["success"] = true;
  return json;
}

function make_failure() {
  var json = { };
  json["status"] = "failure";
  return json;
}

function getDictString(dict, key) {
  var match = dict[key];
  if (match !== undefined) {
    return Js_json.decodeString(match);
  }
  
}

function $great$great(f, g, x) {
  return Curry._1(g, Curry._1(f, x));
}

function logRequest(next, req) {
  var ip$prime = Express.Request[/* ip */10](req);
  var meth = Express.Request[/* methodRaw */13](req);
  var url = Express.Request[/* path */16](req);
  var match = Express.Request[/* bodyText */5](req);
  var text = match !== undefined ? $$String.concat("", /* :: */[
          ": \"",
          /* :: */[
            match,
            /* :: */[
              "\"",
              /* [] */0
            ]
          ]
        ]) : "";
  console.log("" + (String(ip$prime) + (" ~ " + (String(meth) + (" " + (String(url) + ("" + (String(text) + ""))))))));
  return Curry._1(next, Express.Next[/* middleware */0]);
}

function addPerson(_, req) {
  var match = Express.Request[/* bodyText */5](req);
  if (match !== undefined) {
    var partial_arg = match;
    var partial_arg$1 = Express.Response[/* sendString */2];
    return (function (param) {
        return partial_arg$1(partial_arg, param);
      });
  } else {
    var partial_arg$2 = make_failure(/* () */0);
    var partial_arg$3 = Express.Response[/* sendJson */3];
    var partial_arg$4 = Express.Response[/* status */9](/* BadRequest */19);
    return (function (param) {
        var param$1 = Curry._1(partial_arg$4, param);
        return partial_arg$3(partial_arg$2, param$1);
      });
  }
}

function onListen(err) {
  var exit = 0;
  var val;
  try {
    val = err;
    exit = 1;
  }
  catch (raw_exn){
    var exn = Js_exn.internalToOCamlException(raw_exn);
    if (exn[0] === Js_exn.$$Error) {
      console.log(exn[1]);
      Process.exit(1);
      return /* () */0;
    } else {
      throw exn;
    }
  }
  if (exit === 1) {
    console.log("Listening at http://127.0.0.1:3000");
    return /* () */0;
  }
  
}

var api = Express.Router[/* make */15](undefined, undefined, undefined, /* () */0);

Express.Router[/* post */7](api, "/records", Express.Middleware[/* from */5](addPerson));

var app = Express.App[/* make */15](/* () */0);

Express.App[/* use */0](app, Express.Middleware[/* text */1](undefined, undefined, undefined, undefined, /* () */0));

Express.App[/* use */0](app, Express.Middleware[/* from */5](logRequest));

Express.App[/* useRouterOnPath */18](app, "/v1", api);

Express.App[/* listen */19](app, 3000, onListen, /* () */0);

exports.make_success = make_success;
exports.make_failure = make_failure;
exports.getDictString = getDictString;
exports.$great$great = $great$great;
exports.logRequest = logRequest;
exports.addPerson = addPerson;
exports.onListen = onListen;
/* api Not a pure module */
