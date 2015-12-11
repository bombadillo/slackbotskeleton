slack = require '../slackClient'

sendMessageByUserName = (userName, message) ->
  user = slack.getUserByName userName
  dmOpened = slack.openDM user.id
  dm = slack.getDMByName userName

  if dm
    channel = slack.getChannelGroupOrDMByID dm.id
    channel.send message

exports = this
exports.sendMessageByUserName = sendMessageByUserName
