dbHandler = require '../../common/services/dbHandler'
q = require 'q'
bot = require './botHandler'
meetingHandler = require './meetingHandler'
agendaParser = require './agendaInputParser'
agendaOutputter = require './agendaOutputter'
agendaMeetingMapper = require './agendaMeetingMapper'

agendaDbName = 'agenda'

create = (message) ->
  agendaInfo = agendaParser.parse message.parsedMessage.value
  meetingHandler.getOneByName(agendaInfo.meetingName).then (meeting) ->
    if meeting
      obj =
        name: agendaInfo.agendaName
        meetingId: meeting._id
      dbHandler.insert(agendaDbName, obj).then (result) ->
        outputText = if result then 'agenda added' else 'agenda not added'
        bot.reply message, outputText
    else
      bot.reply message, 'meeting does not exist'

getAllForMeeting = (meetingName) ->
  deferred = q.defer()
  meetingHandler.getOneByName(meetingName).then (meeting) ->
    if meeting
      obj =
        meetingId: meeting._id
      dbHandler.getAll(agendaDbName, obj).then (agendas) ->
        deferred.resolve agendas
    else
      deferred.resolve false
  return deferred.promise

outputAllForMeeting = (message) ->
  meetingName = message.parsedMessage.value
  getAllForMeeting(meetingName).then (agendas) ->
    if agendas
      message.meetingName = meetingName
      message.agendas = agendas
      agendaOutputter.outputOne message
    else
      bot.reply message, 'unable to retrieve agenda'

clearAllForMeeting = (message) ->
  meetingName = message.parsedMessage.value
  meetingHandler.getOneByName(meetingName).then (meeting) ->
    if meeting
      obj =
        meetingId: meeting._id
      dbHandler.removeAll(agendaDbName, obj).then (resultObj) ->
        result = resultObj.result.ok
        outputText = if result then 'agenda cleared' else 'agenda not cleared'
        bot.reply message, outputText
    else
      bot.reply message, 'meeting does not exist'

getAll = (message) ->
  meetingHandler.getAll().then (meetings) ->
    getAgendaForAllMeetings(meetings).then (meetings) ->
      message.meetings = meetings
      agendaOutputter.outputAll message

getAgendaForAllMeetings = (meetings) ->
  deferred = q.defer()
  agendaMeetingMapper.map(meetings).then ->
    deferred.resolve meetings
  return deferred.promise

exports = this
exports.create = create
exports.outputAllForMeeting = outputAllForMeeting
exports.clearAllForMeeting = clearAllForMeeting
exports.getAll = getAll
exports.getAllForMeeting = getAllForMeeting
