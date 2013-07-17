async = require 'async'

UsersController =
  activity: (req, res) ->
    authorId = req.param('id')
    limitItems = req.param('limit') ? 0
    skipItems = req.param('skip') ? 0

    Activities.findAllByAuthor(authorId)
      .sort('createdAt DESC')
      .limit(limitItems)
      .skip(skipItems)
      .done (err, activities) ->
        if err
          return console.log err
        res.json {activities}

  feed: (req, res) ->
    userId = req.param('id')
    limitItems = req.param('limit') ? 0
    skipItems = req.param('skip') ? 0

    mUser = {} # define user out here, to use it inside serial tasks
    async.series(
      currentUser: (callback) ->
        Users.find(userId).done (err, user) ->
          mUser = user
          callback err, null

      feedCauses: (callback) ->
        Activities.findAll(
          supportsCause: mUser.followingCauses
        ).done callback

      feedUsers: (callback) ->
        Activities.findAll(
          author: mUser.followingUsers
        ).done callback
    ,
      (err, results)->
        feedObj = {}
        feedArr = []
        # Concatenate causes and users feed
        rawFeed = results.feedCauses.concat results.feedUsers
        # Remove repeated activities
        for activity in rawFeed
          feedObj[activity.id] = activity
        # From obj to array
        feedArr = (value for key, value of feedObj)
        # Sort array date DESC
        feedArr = feedArr.sort (a, b) ->
          a = new Date(a.createdAt)
          b = new Date(b.createdAt)
          if a < b then 1 else (if a > b then -1 else 0)

        res.json {feed: feedArr}
    )

module.exports = UsersController
