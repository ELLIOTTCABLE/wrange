#!/usr/bin/env bats
load '../node_modules/bats-support/load'
load '../node_modules/bats-assert/load'

wrange(){
   # Note that CWD for the purposes of these tests, as executed by `npm run`, is the project root.
   node ./src/cli.bs.js "$@"
}

@test "displays help when invoked with no options" {
   run wrange
   assert_line --partial 'wrange - a person-record parser, sorter, and server'
   assert_success
}

@test "can directly be asked for help" {
   run wrange --help
   assert_line --partial 'wrange - a person-record parser, sorter, and server'
   assert_success
}

@test "can display help for print" {
   run wrange print --help
   assert_line --partial 'wrange-print - Sort, and display, the contents of person-records'
   assert_success
}

@test "can display help for serve" {
   run wrange serve --help
   assert_line --partial 'wrange-serve - Start a REST server publishing given person-records'
   assert_success
}

@test "print: can sort output by one attribute" {
   run wrange print "example_data/people.csv" --sort 'last,desc'
   assert_line -n 0 "Zotto, Felix, Male, Blue, 3/24/2012"
   assert_success
}

@test "print: can sort output lexicographically by multiple attributes" {
   run wrange print "example_data/people.csv" --sort 'gender,asc' --sort 'last,desc'
   assert_line -n 0 "Zoephel, Dixie, Female, Red, 8/18/1991"
   assert_success
}

@test "print: accepts a customized separator" {
   run wrange print "example_data/people.csv" --sort 'last,asc' --sep ' | '
   assert_line -n 0 "Ablitt | Gerik | Male | Black | 2/17/1995"
   assert_success
}

@test "print: accepts field configuration for printing" {
   run wrange print "example_data/people.csv" --sort 'birth,asc' --fields 'last,first,birth'
   assert_line -n 0 "Waistell, Marys, 1/16/1990"
   assert_success
}

@test "print: can accept multiple input files" {
   run wrange print "example_data/people.csv" "example_data/people.pipe-separated"
   assert_line "Vany, Bessy, Female, Orange, 8/20/2011" # from .csv
   assert_line "Beades, Isobel, Female, Orange, 7/31/2013" # from .pipe-separated
   assert_success
}

# TODO: Excercise the server functionality end-to-end, somehow
