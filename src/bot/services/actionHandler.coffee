log = require '../../common/services/log'
meetingHandler = require './meetingHandler'
agendaHandler = require './agendaHandler'
bot = require './botHandler'
commandListDisplayer = require './commandListDisplayer'

process = (message) ->
  action = message.parsedMessage.action
  log.info "processing action #{action}"

  switch action
    when 'addmeeting'
      log.debug 'add meeting'
      meetingHandler.create message
    when 'removemeeting'
      log.debug 'delete meeting'
      meetingHandler.remove message
    when 'getmeetings'
      log.debug 'get meetings'
      meetingHandler.outputAll message
    when 'addagenda'
      log.debug 'add agenda'
      agendaHandler.create message
    when 'getagenda'
      log.debug 'get agenda'
      agendaHandler.outputAllForMeeting message
    when 'getagendas'
      log.debug 'get agendas'
      agendaHandler.getAll message
    when 'clearagenda'
      log.debug 'clear agenda'
      agendaHandler.clearAllForMeeting message
    when 'help'
      log.debug 'help'
      commandListDisplayer.displayAll message
    else
      bot.reply message, 'The command was not recognised :eyes:'
      bot.reply message, 'If you want help, use this `@agendabot help`'

exports = this
exports.process = process
