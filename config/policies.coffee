module.exports.policies =
  '*': true

  ActivitiesController: {
    'create': 'activityIsValid'
  }
