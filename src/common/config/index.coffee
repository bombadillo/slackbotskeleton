mongo = require './mongoDb'

config =
  botApiToken: ''
  logFile: __dirname + '/../../log.json'
  databaseUri: "mongodb://#{mongo.userName}:#{mongo.password}@#{mongo.url}"
  appHost: ''

module.exports = config
