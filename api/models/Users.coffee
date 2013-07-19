# Users model
module.exports =
  attributes:
    name: 'STRING'
    username: 'STRING'
    bio: 'STRING'
    email: 'STRING'
    password: 'STRING'
    followingUsers: [ 'INTEGER' ]
    followingCauses: [ 'INTEGER' ]
    collaboratingCauses: [ 'INTEGER' ]
