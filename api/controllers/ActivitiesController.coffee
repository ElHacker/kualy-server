ActivitiesController =

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

module.exports = ActivitiesController
