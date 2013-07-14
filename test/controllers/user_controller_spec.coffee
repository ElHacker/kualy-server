require 'should'
request = require 'supertest'

describe 'User controller', ->

  describe 'GET /user/:id/activity', ->

    it 'should return the activities posted by a user', (done) ->
      author_id = 1
      request(sails.express.app)
        .get("/user/#{author_id}/activity")
        .set('Content-Type', 'application/json')
        .end (err, res) ->
          res.statusCode.should.equal(200)
          for activity in res.body.activities
            activity.author.should.equal(author_id)
          done(err)
