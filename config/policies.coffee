module.exports.policies =
  '*': true

  UsersController:
    'update': 'userIsValid'
    'destroy': 'methodNotAllowed'
    'followCause': 'userFollowFieldsAreValid'
    'followUser': 'userFollowFieldsAreValid'

  ActivitiesController:
    'create': 'activityIsValid'
