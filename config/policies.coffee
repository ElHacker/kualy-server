module.exports.policies =
  '*': 'authenticated'

  UsersController:
    '*': 'authenticated'
    'update': ['authenticated', 'userIsValid']
    'destroy': ['authenticated', 'methodNotAllowed']
    'followCause': ['authenticated', 'userFollowFieldsAreValid']
    'followUser': ['authenticated', 'userFollowFieldsAreValid']

  ActivitiesController:
    '*': 'authenticated'
    'create': ['authenticated', 'activityIsValid']
    'upKarma': ['authenticated', 'activityKarmaFieldIsValid']
