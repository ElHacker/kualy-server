module.exports.adapters =

  default: "mongo"

  disk:
    module: "sails-dirty"
    filePath: "./.tmp/dirty.db"
    inMemory: false

  mongo:
    module: 'sails-mongo'
    url: process.env.MONGOLAB_URI || 'mongodb://localhost:27017/sails'

