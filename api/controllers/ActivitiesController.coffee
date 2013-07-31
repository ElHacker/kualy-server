ActivitiesController =

  index: (req, res) ->
    authorId = req.param('author')
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

  create: (req, res) ->
    unless req.form.isValid
      # Invalid form, handle errors
      res.json {errors: req.form.errors}, 422
    else
      Activities.create(
        body: req.form.body
        author: req.form.author
        supportsCause: req.form.supportsCause
        location: req.form.location
        mediaURL: req.form.mediaURL
        mentions: req.form.mentions
        repliesTo: req.form.repliesTo
      ).done (err, activity) ->
        if err
          return res.json {error: err}, 404
        res.json activity, 200

  upKarma: (req, res) ->
    unless req.form.isValid
      res.json {errors: req.form.errors}, 422
    else
      activityId = req.param('id')
      Activities.find(activityId).done (error, activity) ->
        if error then return json({error}, 500)
        unless activity then return res.json({error: 'No activity with that id'}, 404)

        if activity.karma?
          if req.form.userId in activity.karma
            return res.json {error: 'You can vote only once'}, 403
          else
            activity.karma.push req.form.userId
        else
          activity.karma = [req.form.userId]

        Activities.update activityId, {karma: activity.karma}, (error, updatedActivity) ->
          res.json {karma: updatedActivity.karma}, 200

module.exports = ActivitiesController
