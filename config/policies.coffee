module.exports.policies =
  '*': true

  UsersController: {
    'update': 'userIsValid'
  }

  ActivitiesController: {
    'create': 'activityIsValid'
  }
