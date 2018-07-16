// FIXME: I would think BuckleScript would have their own shim for this; it seems redundant ...
const Symbol = require('es6-symbol')
    , isSymbol = require('es6-symbol/is-symbol')

const PersonModule = require('./person.bs')


// type gender = Male | Female | Neither | Unspecified
// type colour = Black | White | Red | Orange | Yellow | Green | Blue | Indigo | Violet
const Person = exports.Person = {
   male:          Symbol('male'),
   female:        Symbol('female'),
   neither:       Symbol('neither'),
   unspecified:   Symbol('unspecified'),

   black:         Symbol('black'),
   white:         Symbol('white'),
   red:           Symbol('red'),
   orange:        Symbol('orange'),
   yellow:        Symbol('yellow'),
   green:         Symbol('green'),
   blue:          Symbol('blue'),
   indigo:        Symbol('indigo'),
   violet:        Symbol('violet')
}


// XXX: I abhor doing this manual invariants-checking when I'm using a strongly-typed language.
//      “What the hell, BuckleScript?”, part N ...
exports.Person.create = function(obj, first_name = null, gender, favourite_colour, birthday){
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

   return PersonModule.of_object(obj)
}

exports.Person.extract = PersonModule.to_object
