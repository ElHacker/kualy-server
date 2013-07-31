module.exports.routes = 
  '/':
    controller: 'home'

  'post /users/:id/followingCauses':
    controller: 'users'
    action: 'followCause'

  'post /users/:id/followingUsers':
    controller: 'users'
    action: 'followUser'

  'get /users/:id/feed':
    controller: 'users'
    action: 'feed'

  'post /activities/:id/karma':
    controller: 'activities'
    action: 'upKarma'
