require 'should'
request = require 'supertest'

describe 'Activities controller', ->

  describe 'POST /activities', (done) ->

    it 'should not create a invalid formatted activity', (done) ->
      activity = {}
      request(sails.express.app)
        .post('/activities')
        .send(activity)
        .set('Content-Type', 'application/json')
        .end (err, res) ->
          if err then done(err)
          res.should.have.status 422
