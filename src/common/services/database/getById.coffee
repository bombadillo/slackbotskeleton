dbConnector = require './dbConnector'
BSON = require('bson').BSONPure
q = require 'q'

getById = (collection, id) ->
  o_id = new BSON.ObjectID id
  deferred = q.defer()
  dbConnector.connect().then (db) ->
    collection = db.collection(collection)
    collection.find(_id: o_id).toArray (err, result)->
      if err
        console.log err
      else
        deferred.resolve result
  return deferred.promise

  module.exports = getById
