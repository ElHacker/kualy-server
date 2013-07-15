module.exports.routes = 
  '/':
    controller: 'home'

  'get /users/:id/activity':
    controller: 'users'
    action: 'activity'
