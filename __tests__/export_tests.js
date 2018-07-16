const wrange = require('../src/exports.js');

describe("Exports", () => {
  test("exists", () => {
    expect(wrange).toBeDefined()
  })

  describe("Person", () => {
    test("exists", () => {
      expect(wrange.Person).toBeDefined()
    })

    test("can be created from JS", () => {
      expect(wrange.Person.create).toBeInstanceOf(Function)
    })
  })
}) // describe Exports

