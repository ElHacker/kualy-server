Users = [
  {
    id: 1
    name:'Braulio Chavez'
    username: 'HackerOfDreams'
    bio: 'Super Hacker'
    email: 'braulio@kualy.com'
    followingUsers: []
    followingCauses: [1]
    collaboratingCauses: [1]
  },
  {
    id: 2
    name:'Foo Bar'
    username: 'FooBar'
    bio: 'Extra foo bar'
    email: 'foo@bar.com'
    followingUsers: [1]
    followingCauses: [1, 2]
    collaboratingCauses: [1, 2]
  }
]

module.exports = Users
