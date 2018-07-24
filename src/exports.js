// FIXME: I would think BuckleScript would have their own shim for this; it seems redundant ...
const Symbol = require('es6-symbol')
    , isSymbol = require('es6-symbol/is-symbol')

const $Person = require('./person.bs')


// XXX: I abhor doing this manual invariants-checking when I'm using a strongly-typed language.
//      “What the hell, BuckleScript?”, part N ...
const Person = exports.Person =
function(obj, first_name = null, gender, favourite_colour, birthday){
   if (typeof obj !== 'object' || first_name !== null)
      obj = {
         last_name: obj,
         first_name: first_name,
         gender: gender,
         favourite_colour: favourite_colour,
         birthday: birthday
      }

   if (typeof obj.last_name !== 'string')
      throw new ArgumentError("last_name must be a String")
   if (typeof obj.first_name !== 'string')
      throw new ArgumentError("first_name must be a String")

   if (!(obj.birthday instanceof Date))
      throw new ArgumentError("birthday must be a Date")

   // Jesus Christ, I literally even have to duplicate the *entire sum-type* here!?
   switch (obj.gender) {
      case Person.male:
      case Person.female:
      case Person.neither:
      case Person.unspecified:
         break
      default:
         throw new ArgumentError("gender is of an unknown configuration")
   }

   switch (obj.favourite_colour) {
      case Person.black:
      case Person.white:
      case Person.red:
      case Person.orange:
      case Person.yellow:
      case Person.green:
      case Person.blue:
      case Person.indigo:
      case Person.violet:
         break
      default:
         throw new ArgumentError("favourite_colour is of an unknown configuration")
   }

   const person = $Person.of_object(obj)
   person.birthdayString = Person.prototype.birthdayString
   return person
}

Person.male =        Symbol('male'),
Person.female =      Symbol('female'),
Person.neither =     Symbol('neither'),
Person.unspecified = Symbol('unspecified'),

Person.black =       Symbol('black'),
Person.white =       Symbol('white'),
Person.red =         Symbol('red'),
Person.orange =      Symbol('orange'),
Person.yellow =      Symbol('yellow'),
Person.green =       Symbol('green'),
Person.blue =        Symbol('blue'),
Person.indigo =      Symbol('indigo'),
Person.violet =      Symbol('violet')

Person.extract = $Person.to_object

Person.prototype.birthdayString = function(){
   return $Person.string_of_birthday(this)
}


// FIXME: This doesn't actually create values that inherit, prototypically, from `Set`. Cheatin'.
let Set = exports.Person.Set =
function(){
   let set = $Person.set_create()
   set.add = Set.prototype.add
   set.find = Set.prototype.find
   set.toArray = Set.prototype.toArray
   return set
}


// Given a `Person` (well, at least, a value retured by `new Person()`...), add that person to the
// receiving `Set` (well, at least, to whatever sort of value is returned by `new Person.Set()`.)
Set.prototype.add = function(abs_person){
   $Person.set_add(this, abs_person)
}

Set.prototype.find = function(last, first, birthday){
   return $Person.set_find_exn(this, last, first, birthday)
}
