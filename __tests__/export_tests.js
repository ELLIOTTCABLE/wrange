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

      test("can be successfully created from JS", () => {
         const person = Person.create("Last Name", "First Name", "Female", "Blue",
            new Date(1966, 2, 7))
         expect(person).toBeDefined()
      })
   })
}) // describe Exports
