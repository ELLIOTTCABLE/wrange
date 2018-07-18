%token SEP
%token <string> VAL
%token NL

%token EOF

%start <Person.t list> doc

%%

doc:
   | it = rev_records; EOF { it }
   ;

rev_records:
           | rest = rev_records; re = record; NL  { re :: rest }
           | (* base-case: empty *) { [] }
           ;

record:
   last_name = VAL; SEP; first_name = VAL; SEP; gender = VAL; SEP;
   favourite_colour = VAL; SEP; birthday = VAL
   { Person.of_string_description ~last_name ~first_name ~gender ~favourite_colour ~birthday }
