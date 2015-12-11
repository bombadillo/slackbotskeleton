dbConnector = require './dbConnector'
q = require 'q'

insert = (collection, data) ->
  deferred = q.defer()
  dbConnector.connect().then (db)->
    collection = db.collection collection
    collection.insert data, (err, records) ->
      if err
        console.log err
        deferred.resolve false
      else
        deferred.resolve true
  return deferred.promise

module.exports = insert
