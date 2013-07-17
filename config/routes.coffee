module.exports.routes = 
  '/':
    controller: 'home'

  'get /users/:id/activity':
    controller: 'users'
    action: 'activity'

  'get /users/:id/feed':
    controller: 'users'
    action: 'feed'
