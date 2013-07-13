# User model
module.exports =
  attributes:
    name: 'STRING'
    username: 'STRING'
    bio: 'STRING'
    email: 'STRING'
    followingUsers: [ 'INTEGER' ]
    followingCauses: [ 'INTEGER' ]
    collaboratingCauses: [ 'INTEGER' ]
