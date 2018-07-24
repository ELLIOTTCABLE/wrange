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

      test("represents the creation-function in JS", () => {
         expect(Person).toBeInstanceOf(Function)
      })

      test("exports acceptable symbols for variant arguments", () => {
         expect(typeof Person.female).toBe("symbol")
         expect(typeof Person.yellow).toBe("symbol")
      })

      test("can be successfully created from JS", () => {
         const it = new Person("Last Name", "First Name", Person.female, Person.blue,
            new Date(1966, 2, 7))
         expect(it).toBeDefined()
      })

      test("preforms basic validation of values coming in from the JS-side", () => {
         expect(()=> new Person("Last Name" /*, missing_arguments */) ).toThrowError()
         expect(()=> new Person(1234 /* incorrect type */, "First Name", Person.female,
            Person.blue, new Date(1966, 2, 7)) ).toThrowError()
         expect(()=> new Person("Last Name", "First Name", Person.green /* disallowed variant */,
            Person.blue, new Date(1966, 2, 7)) ).toThrowError()
      })

      test("can be extracted back into a JS Object after being received", () => {
         const props = {
            last_name: "Last Name",
            first_name: "First Name",
            gender: Person.female,
            favourite_colour: Person.blue,
            birthday: new Date(1966, 2, 7)
         }

         const it = new Person(props)
         expect(Person.extract(it)).toEqual(props)
      })
   }) // describe Person

   describe("Person.Set", () => {
      const Person = wrange.Person
      test("exists", () => {
         expect(Person.Set).toBeDefined()
      })

      test("represents the set-create-function in JS", () => {
         expect(Person.Set).toBeInstanceOf(Function)
      })

      test("can successfully create a set from JS", () => {
         const set = new Person.Set()
         expect(set).toBeDefined()
      })

      test("can have people added", () => {
         const person = new Person("Last Name", "First Name", Person.female, Person.blue,
            new Date(1966, 2, 7))

         const set = new Person.Set()
         expect(()=> set.add(person) ).not.toThrow()
      })

      test.skip("can find added people", () => {
         const person = new Person("Last Name", "First Name", Person.female, Person.blue,
            new Date(1966, 2, 7))
             , set = new Person.Set()
         set.add(person)

         const rv = set.find("Last Name", "First Name", "1966-2-7")
      })
   })

}) // describe Exports
