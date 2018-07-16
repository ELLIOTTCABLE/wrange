const wrange = require('../src/exports.js');

describe("Exports", () => {
   test("exists", () => {
      expect(wrange).toBeDefined()
   })

   describe("Person", () => {
      const Person = wrange.Person
      test("exists", () => {
         expect(Person).toBeDefined()
      })

      test("exports the creation-function in JS", () => {
         expect(Person.create).toBeInstanceOf(Function)
      })

      test("exports acceptable symbols for variant arguments", () => {
         expect(typeof Person.female).toBe("symbol")
      })

      test("can be successfully created from JS", () => {
         const it = Person.create("Last Name", "First Name", Person.female, Person.blue,
            new Date(1966, 2, 7))
         expect(it).toBeDefined()
      })

      test("preforms basic validation of values coming in from the JS-side", () => {
         expect(()=> Person.create("Last Name" /*, missing_arguments */) ).toThrowError()
         expect(()=> Person.create(1234 /* incorrect type */, "First Name", Person.female,
            Person.blue, new Date(1966, 2, 7)) ).toThrowError()
         expect(()=> Person.create("Last Name", "First Name", Person.green /* disallowed variant */,
            Person.blue, new Date(1966, 2, 7)) ).toThrowError()
      })
   })
}) // describe Exports
