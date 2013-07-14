Sails = require 'sails'
fixtureUsers = require './fixtures/models/Users'
app = {}

before (done) ->
  # Lift sails and store app reference
  Sails.lift {

    # turn down the log level so we can see the test results
    log:
      level: 'error'

    # send database connections down if needed
    adapters:
      disk:
        module: 'sails-dirty'
        filePath: './.tmp/dirty-test.db'
        inMemory: true

  }, (err, sails) ->
    # Save reference for the teardown function
    app = sails

    if err
      done(err)
    else
      # Create user fixture records in database
      User.createEach fixtureUsers, () ->
        console.log "DONE creating users"
        done()

after (done) ->
  # Kill the server
  app.express.server.close(done)
