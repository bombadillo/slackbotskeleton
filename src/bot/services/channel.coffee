slack = require './slackClient'

sendMessageById = (id, message) ->
  channel = slack.getChannelGroupOrDMByID id
  sendMessage channel, message

sendMessage = (channel, message) ->
  channel.send message

exports = this
exports.sendMessageById = sendMessageById
exports.sendMessage = sendMessage
