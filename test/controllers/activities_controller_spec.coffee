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
          done()

    it 'should create a valid formatted activity', (done) ->
      activity =
        body: 'Good action'
        author: 1
        supportsCause: 1
        location: 'Hacker House'
        mediaURL: 'http://foo.com/bar.jpeg'
        mentions: [2]
        repliesTo: [2]

      request(sails.express.app)
        .post('/activities')
        .send(activity)
        .set('Content-Type', 'application/json')
        .end (err, res) ->
          if err then done(err)
          res.should.have.status 200
          done()
