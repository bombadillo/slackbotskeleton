messageTextConverter = require './messageTextConverter'

parse = (message) ->
  message.parsedMessage = messageTextConverter.toObject message.text
  return message

exports = this
exports.parse = parse
