module.exports.policies =
  '*': true

  UsersController:
    'update': 'userIsValid'
    'destroy': 'methodNotAllowed'

  ActivitiesController:
    'create': 'activityIsValid'
