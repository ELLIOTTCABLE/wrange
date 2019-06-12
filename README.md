# wrange

An assignment.

Implemented in OCaml & Node.js, via [BuckleScript](https://bucklescript.github.io/); a decision
which cost me quite a bit of time, about a year ago.

## Installation

For ease of use, I've shipped compiled JavaScript sources directly in the Git repo. This would
normally be a bad idea ... but I'm pretty sure the target audience hereof isn't likely to have an
up-to-date OCaml compiler just sitting around. (In an ideal world, that would probably mean "resort
to shipping a Dockerfile", but, again. time constraints.)

tl;dr:

    git clone https://github.com/ELLIOTTCABLE/wrange.git
    cd wrange
    npm install

## Usage

(If you're unfamiliar with Node, you can run commands in the root directory of this project as if
you'd installed it globally, by replacing the command-name with `npx .` in the following commands.)

Usage is fairly-thoroughly documented via the built-in command-line help & manpage functionality.
Try, for example,

    wrange --help
    wrange print --help
    wrange serve --help

For the printing-CLI, invocations that produce the requested outputs are as follows:

```sh
$ wrange print example_data/* \
   --sort gender,asc --sort last,asc --fields last,first,gender
Abbet, Fey, Female
Abelevitz, Flora, Female
Ablett, Emelina, Female
...

$ wrange print example_data/* \
   --sort birth,asc --fields last,first,birth
Kelsey, Sigismond, 1/5/1990
Waistell, Marys, 1/16/1990
Beall, Jozef, 1/17/1990
...

$ wrange print example_data/* \
   --sort last,desc --fields last,first
deLloyd, Agnola
deGlanville, Keen
deChastelain, Jackquelin
...
```

As for the REST server, start it with the `serve` command, and then feed it some requests. For
example, if you have [HTTPie][] installed,

```sh
$ wrange serve example_data/* &
Serving 3000 records;
Listening at http://127.0.0.1:3000
[1] 2530

$ http POST :3000/v1/records Content-Type:text/plain \
   <<< "Cable | Elliott | Male | Green | 1989-01-01"
HTTP/1.1 201 Created
{   "status": "success",
    "value": [ {
            "birthday": "1989-01-01T00:00:00.000Z",
            "favourite_colour": "Green",
            "first_name": "Elliott",
...

$ http
http GET :3000/v1/records/last/ascending | jq '.value[0:3] | .[] | .last_name'
"Abbet"
"Abelevitz"
"Ablett"
```

   [HTTPie]: <https://httpie.org/> "An intuitive and simple, yet powerful, command-line HTTP client"

## Contributing / Building
To make modifications to, or build from, ML sources; as long as you make no changes to the parser
or lexer components (which you shouldn't need to, as they're very simple), the scripts included in
the `package.json` should get you pretty far out-of-the-box:

    git clone https://github.com/ELLIOTTCABLE/wrange.git
    cd wrange
    npm install
    npm run build
    npm run test

If you want to modify `parser.mly` or `lexer.mll`, though, you'll need a full OCaml development
environment, Menhir, and ocamllex.
