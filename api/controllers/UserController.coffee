UserController =
  activity: (req, res) ->
    authorId = req.param('id')
    limitItems = req.param('limit') ? 0
    skipItems = req.param('skip') ? 0

    Activity.findAllByAuthor(authorId)
      .sort('createdAt DESC')
      .limit(limitItems)
      .skip(skipItems)
      .done (err, activities) ->
        if err
          return console.log err
        res.json {activities}

module.exports = UserController
