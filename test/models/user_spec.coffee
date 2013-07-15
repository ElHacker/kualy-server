require 'should'

describe 'User', ->
  it 'should have the right structure', (done) ->
    Users.find(1).done (err, user) ->
      if err
        done(err)
      else
        user.should.have.property 'name'
        user.should.have.property 'username'
        user.should.have.property 'bio'
        user.should.have.property 'email'
        user.should.have.property 'followingUsers'
        user.should.have.property 'followingCauses'
        user.should.have.property 'collaboratingCauses'
        done()
