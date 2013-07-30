module.exports.routes = 
  '/':
    controller: 'home'

  'post /users/:id/followingCauses':
    controller: 'users'
    action: 'followCause'

  'post /users/:id/followingUsers':
    controller: 'users'
    action: 'followUser'

  'get /users/:id/activity':
    controller: 'users'
    action: 'activity'

  'get /users/:id/feed':
    controller: 'users'
    action: 'feed'
