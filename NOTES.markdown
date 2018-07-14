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
