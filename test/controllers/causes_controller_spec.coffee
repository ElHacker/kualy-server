require 'should'
request = require 'supertest'

describe 'Causes controller', ->

  describe 'GET /causes/:id', ->

    it 'should return a cause', (done) ->
      causeId = 1
      request(sails.express.app)
        .get("/causes/#{causeId}")
        .set('Content-Type', 'application/json')
        .end (err, res) ->
          if err then done(err)
          cause = res.body
          res.should.have.status 200
          cause.id.should.eql causeId
          cause.should.have.property 'name'
          cause.should.have.property 'description'
          cause.should.have.property 'collaborators'
          done()
