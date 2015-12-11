mongoClient = require('mongodb').MongoClient
config = require '../../config/index'
url = config.databaseUri
q = require 'q'
log = require '../../../common/services/log'

dbConnection = undefined

connect = ->
  deferred = q.defer()
  if !dbConnection
    mongoClient.connect url, (err, db) ->
      if err
        log.error 'Unable to connect'
        log.error err
      else
        log.info 'Connected'
        dbConnection = db
        deferred.resolve db
  else
    deferred.resolve dbConnection
  return deferred.promise

exports = this
exports.connect = connect
