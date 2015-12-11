dbConnector = require './dbConnector'
q = require 'q'

getOne = (collection, params) ->
  params = params || {}
  deferred = q.defer()
  dbConnector.connect().then (db) ->
    collection = db.collection(collection)
    collection.findOne params, (err, result) ->
      if err
        console.log err
      else
        deferred.resolve result
  return deferred.promise

module.exports = getOne
