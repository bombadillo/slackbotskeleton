dbConnector = require './dbConnector'
q = require 'q'

removeOne = (collection, params) ->
  deferred = q.defer()
  dbConnector.connect().then (db) ->
    collection = db.collection(collection)
    collection.deleteOne(params, (err, result) ->
      if err
        console.log err
      else
        deferred.resolve result
    )
  return deferred.promise

module.exports = removeOne
