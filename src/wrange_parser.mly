%token <string> SEP
%token <string> VAL
%token NL

%token EOF

%start <Person.t list> doc

%%

doc:
   | EOF              { [] }
   | it = rev_records { it }
   ;

rev_records:
           | (* base-case: empty *) { [] }
           | rest = rev_records; record; NL  { record :: rest }
           | rest = rev_records; record; EOF { record :: rest }
           ;

record:
   last_name = name_field; SEP; first_name = name_field; SEP; gender = gender_field; SEP;
   favourite_colour = colour_field; SEP; birthday = date_field
   { {last_name; first_name; gender; favourite_colour; birthday} }

name_field: str = VAL { str }

gender_field:
            | VAL("male" { Person.Male }
            | VAL "female" { Person.Female }
            ;
