availableCommands = require '../../common/availableCommands'
eol = require('os').EOL
bot = require './botHandler'

displayAll = (message) ->
  outputText = "`Available commands` #{eol}"
  for command in availableCommands
    outputText += "*#{command.command}* #{eol}"
    outputText += ">#{command.description} #{eol}"
    outputText += ">Usage: #{command.example} #{eol}"

  bot.reply message, outputText


exports = this
exports.displayAll = displayAll
