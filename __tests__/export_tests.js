const wrange = require('../src/wrange.bs.js');

describe('Exports', () => {
  test('Submodules exist', () => {
    expect(wrange).toBeDefined()
    expect(wrange).toHaveProperty('Person')
  });
});

