bot = require './botHandler'
eol = require('os').EOL

output = (message) ->
  outputText = "*Meetings* #{eol}"
  for meeting in message.meetings
    outputText += "> #{meeting.name} #{eol}"
  outputText = outputText.slice 0, -2
  bot.reply message, outputText

exports = this
exports.output = output
