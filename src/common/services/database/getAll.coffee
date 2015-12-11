dbConnector = require './dbConnector'
q = require 'q'

getAll = (collection, params) ->
  params = params || {}
  deferred = q.defer()
  dbConnector.connect().then (db) ->
    collection = db.collection(collection)
    collection.find(params).toArray (err, result)->
      if err
        console.log err
      else
        deferred.resolve result
  return deferred.promise

module.exports = getAll
