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

      test("exports a creation-function in JS", () => {
         expect(Person.create).toBeInstanceOf(Function)
      })
   })
}) // describe Exports
