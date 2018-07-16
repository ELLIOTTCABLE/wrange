Plan
----
 - Three modules: CLI, data ingestion/parser, and server
    - nope, four. data model.
 - tentatively Reason:
    - Node excels at server/http/networking stuff, and is very accessible
    - quick, sound, testable
 - given my newness, may fall back to OCamlopt or vanilla Node.

Parser
======
 - modally switch between the dictated input formats:
   - comma, pipe, or space
 - since I can safely assume no input contains those characters, I can also consume format-unknown,
   and specialize upon seeing a given delimiter

Data model
==========
 - Handles the storage and updating (either via parsed input-files, or REST calls) of records
 - Handles providing sorted content to the other modules

CLI
===
 - invokes the parser to construct the in-memory representation
 - exposes flags for format, and sorting

Server
======
 - four methods, forks from the CLI with a flag


Log
---

nope. bsb turned out to be a hot fracking mess and timesink. I think I'll either manually invoke the
compiler, or just quarantine my OCaml to a single one of the aforementioned modules.

----

welp can't even install "reason" packages, i.e. typing bindings to JS, without bsb. hot. fracking.
mess.

----

took a burn-the-bridges approach to getting BuckleScript build-system working, since I seemed to
have no other option unless I wanted to abandon ML entirely (was maybe minutes away from doing
exactly that), but it finally panned out.

unfortunately, that was perhaps not for the best, in the long-run. lots of shortcomings:

 - BuckleScript's support for exposing submodules — an extremely foundational ML feature — is
      currently sub-par. <https://github.com/BuckleScript/bucklescript/issues/2948>
 - There's again sub-par support for OCaml's AST-macro-system, ‘ppx rewriters.’ Not making me happy,
      as these are really basic elements of kit in most OCaml code.
      <https://github.com/BuckleScript/bucklescript/issues/2407>
 - finally, a language that compiles a typedast down to an untyped language, without at least
      optional features for generating runtime typechecking at the interface boundaries!? See
      exports.js; I basically had to write all of that by hand for one function.

   (Probably just going to give up on checking invariants at the intf-bounds, this is a waste of my
   life. -_-@)

I moved on to working in the parser. Aforementioned lack of support for super bog-standard, modern
tools (jbuilder/dune, Sedlex) meant I had to go with tools I know a lot less-well. Ran into some
really embarrasing, newbie parsing problems, which for now, I've farmed out to Stack Overflow:
<https://stackoverflow.com/questions/51370405/branching-at-the-parser-lever-based-on-the-content-of-a-token>

At least I'm sure I can abandon some safety and explicitness in the parser and Just Finish™ this, if
I don't find a timely solution to what's ailing me there.

Going to switch tracks entirely when I come back to this, dive into the REST API, even though that
depends on the currently-blocked parser for ingestion, at least I can make some progress on it.
