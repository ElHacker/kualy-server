require 'should'
request = require 'supertest'

describe 'Users controller', ->

  describe 'GET /users/:id', ->

    it 'should return a user', (done) ->
      userId = 1
      request(sails.express.app)
        .get("/users/#{userId}")
        .set('Content-Type', 'application/json')
        .end (err, res) ->
          if err then return done(err)
          user = res.body
          res.should.have.status 200
          user.id.should.eql userId
          user.should.have.property 'name'
          user.should.have.property 'username'
          user.should.have.property 'bio'
          user.should.have.property 'email'
          user.should.have.property 'followingUsers'
          user.should.have.property 'followingCauses'
          user.should.have.property 'collaboratingCauses'
          done()

  describe 'PUT /users/:id', ->

    it 'should update a user', (done) ->
      user =
        id: 1
        name: 'New Name'
        username: 'newUserName'
        bio: 'new bio'
        email: 'new@email.com'
      request(sails.express.app)
        .put("/users/#{user.id}")
        .set('Content-Type', 'application/json')
        .send(user)
        .end (err, res) ->
          if err then return done(err)
          updatedUser = res.body
          res.should.have.status 200
          updatedUser.id.should.eql user.id
          updatedUser.name.should.eql user.name
          updatedUser.username.should.eql user.username
          updatedUser.bio.should.eql user.bio
          updatedUser.email.should.eql user.email
          done()

  describe 'DELETE /users/:id', ->

    it 'should not destroy a user', (done) ->
      userId = 1
      request(sails.express.app)
        .del("/users/#{userId}")
        .end (err, res) ->
          console.log err
          res.should.have.status 405
          done()

  describe 'GET /users/:id/activity', ->

    it 'should return the activities posted by a user', (done) ->
      userId = 1
      request(sails.express.app)
        .get("/users/#{userId}/activity")
        .set('Content-Type', 'application/json')
        .end (err, res) ->
          if err then return done(err)
          res.should.have.status(200)
          for activity in res.body.activities
            activity.author.should.equal(userId)
          done()

  describe 'GET /users/:id/feed', ->

    it 'should return the feed containing activities by users and causes followed by a user', (done) ->
      userId = 1
      Users.find(userId).done (err, user) ->
        if err then return done(err)
        request(sails.express.app)
          .get("/users/#{userId}/feed")
          .set('Content-Type', 'application/json')
          .end (err, res) ->
            feed = res.body.feed
            res.should.have.status(200)
            feed.should.be.an.instanceOf(Array)
            # array that contains the users and causes followed by current user
            userIsFollowing = user.followingUsers.concat user.followingCauses
            # TODO: this test seems not to be 100% right
            for activity in feed
              userIsFollowing.should.include(activity.author)
              userIsFollowing.should.include(activity.supportsCause)
            done()
