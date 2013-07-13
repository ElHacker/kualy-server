module.exports = (req, res, ok) ->
  if req.session.authenticated
    ok()
  else
    res.send "You are not permitted to perform this action.", 403
