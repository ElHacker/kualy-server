passport = require 'passport'
DigestStrategy = require('passport-http').DigestStrategy

# Use the DigestStrategy to configure Passport
passport.use(new DigestStrategy(qop: 'auth',
  (username, done) ->
    User.findByUsername username, (err, user) ->
      if err then return done(err)
      unless user then return done(null, false)
      return done(null, user, user.password)
, (params, done) ->
    # Validate nonces as necessary
    done null, true
))

module.exports =
  appName: "Kualy"
  port: process.env.PORT || 1337
  environment: "development"
  log:
    level: "verbose"
  # Custom express middleware
  # we use this to register the passport middleware
  # NOTE: no need to use session middleware when each
  # request carries authentication credentials,
  # as is the case with HTTP digest
  express:
    customMiddleware: (app) ->
      app.use passport.initialize()
