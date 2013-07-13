# User model
module.exports =
  attributes:
    name: "STRING"
    username: "STRING"
    bio: "STRING"
    email: "STRING"
    followingUser: [ "INTEGER" ]
    followingCauses: [ "INTEGER" ]
    collaboratingCauses: [ "INTEGER" ]
