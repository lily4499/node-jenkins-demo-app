const request = require('supertest');
const app = require('../app');

describe('GET /', () => {
  it('should return 200 and welcome message', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toEqual(200);
    expect(res.text).toContain('Hello');
  });
});
