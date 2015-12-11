dbConnector = require './dbConnector'
q = require 'q'

removeAll = (collection, params) ->
  deferred = q.defer()
  dbConnector.connect().then (db) ->
    collection = db.collection(collection)
    collection.deleteMany(params, (err, result) ->
      if err
        console.log err
      else
        deferred.resolve result
    )
  return deferred.promise

module.exports = removeAll
