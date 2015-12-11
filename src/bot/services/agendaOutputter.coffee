bot = require './botHandler'
eol = require('os').EOL

outputOne = (message) ->
  outputText = createOutput message.meetingName, message.agendas
  bot.reply message, outputText

outputAll = (message) ->
  outputText = ''

  for meeting in message.meetings
    outputText += createOutput meeting.name, meeting.agendas

  bot.reply message, outputText

createOutput = (meetingName, agendas) ->
  outputText = "`Agenda for #{meetingName}` #{eol}"

  if agendas.length > 0
    outputText += formatAllAgendas agendas
  else
    outputText += ">_Agenda is empty_#{eol}"
  return outputText

formatAllAgendas = (agendas) ->
  outputText = ''
  for agenda in agendas
    outputText += "> #{agenda.name} #{eol}"
  return outputText

exports = this
exports.outputOne = outputOne
exports.outputAll = outputAll
