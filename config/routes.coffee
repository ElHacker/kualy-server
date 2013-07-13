module.exports.routes = 
  '/':
    controller: 'home'

  'get /user/:id/activity':
    controller: 'user'
    action: 'activity'
