'use strict';

var Curry = require("bs-platform/lib/js/curry.js");
var Cmdliner = require("@elliottcable/bs-cmdliner/src/cmdliner.bs.js");

process.argv.shift()
;

function hello() {
  console.log("Hello, world!");
  return /* () */0;
}

var hello_t = Cmdliner.Term[/* $ */3](Cmdliner.Term[/* const */0](hello), Cmdliner.Term[/* const */0](/* () */0));

var eta = Cmdliner.Term[/* eval */16](undefined, undefined, undefined, undefined, undefined, /* tuple */[
      hello_t,
      Curry.app(Cmdliner.Term[/* info */14], [
            undefined,
            undefined,
            undefined,
            undefined,
            undefined,
            undefined,
            undefined,
            undefined,
            "wrange"
          ])
    ]);

Cmdliner.Term[/* exit */24](undefined, eta);

exports.hello = hello;
exports.hello_t = hello_t;
/*  Not a pure module */
