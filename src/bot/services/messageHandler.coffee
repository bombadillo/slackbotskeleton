messageParser = require './messageParser'
botHandler = require './botHandler'
actionHandler = require './actionHandler'
messageParser = require './messageParser'

handle = (message) ->
  message = messageParser.parse message

  if !message.parsedMessage
    console.log ':('
  else if message.parsedMessage.userId == botHandler.getId message
    actionHandler.process message
  else
    console.log ':('

exports = this
exports.handle = handle
