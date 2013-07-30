module.exports.routes = 
  '/':
    controller: 'home'

  'post /users/:id/followingCauses':
    controller: 'users'
    action: 'followCause'

  'get /users/:id/activity':
    controller: 'users'
    action: 'activity'

  'get /users/:id/feed':
    controller: 'users'
    action: 'feed'
