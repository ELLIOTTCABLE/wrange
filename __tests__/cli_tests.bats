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
   assert_failure
}
