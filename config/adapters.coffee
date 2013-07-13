module.exports.adapters =
  default: "disk"
  memory:
    module: "sails-dirty"
    inMemory: true

  disk:
    module: "sails-dirty"
    filePath: "./.tmp/dirty.db"
    inMemory: false

  mysql:
    module: "sails-mysql"
    host: "YOUR_MYSQL_SERVER_HOSTNAME_OR_IP_ADDRESS"
    user: "YOUR_MYSQL_USER"
    password: "YOUR_MYSQL_PASSWORD"
    database: "YOUR_MYSQL_DB"
