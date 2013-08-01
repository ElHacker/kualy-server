passport = require 'passport'

# Authenticate using HTTP Digest credentials, with session support disabled
module.exports = (req, res, next) ->
  if sails.config.environment == 'development'
    # Avoid authentication if on development environment
    next()
  else
    passport.authenticate('digest', session: false)(req, res, next)
