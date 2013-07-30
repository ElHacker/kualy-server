module.exports.policies =
  '*': true

  UsersController:
    'update': 'userIsValid'
    'destroy': 'methodNotAllowed'
    'followCause': 'userFollowFieldsAreValid'

  ActivitiesController:
    'create': 'activityIsValid'
