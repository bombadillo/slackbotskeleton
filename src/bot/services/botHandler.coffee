channel = require './channel'

getId = (message) ->
  return message._client.self.id

reply = (messageObj, message) ->
  channel.sendMessageById messageObj.channel, message

exports = this
exports.getId = getId
exports.reply = reply
