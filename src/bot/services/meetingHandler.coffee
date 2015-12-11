dbHandler = require '../../common/services/dbHandler'
q = require 'q'
meetingOutputter = require './meetingOutputter'
bot = require './botHandler'
agendaHandler = require './agendaHandler'
meetingDbName = 'meeting'

create = (message) ->
  meetingName = message.parsedMessage.value
  getOneByName(meetingName).then (meeting) ->
    if !meeting
      obj = name: meetingName
      dbHandler.insert(meetingDbName, obj).then (result) ->
        outputText = if result then 'meeting added' else 'meeting not added'
        bot.reply message, outputText
    else
      bot.reply message, 'meeting exists'

remove = (message) ->
  meetingName = message.parsedMessage.value
  getOneByName(meetingName).then (meeting) ->
    if meeting
      agendaHandler.clearAllForMeeting message
      obj = name: meetingName
      dbHandler.removeOne(meetingDbName, obj).then (resultObj) ->
        result = resultObj.result.ok
        outputText = if result then 'meeting removed' else 'meeting not removed'
        bot.reply message, outputText
    else
      bot.reply message, 'meeting does not exist'

getAll = (message) ->
  deferred = q.defer()
  dbHandler.getAll(meetingDbName).then (meetings) ->
    deferred.resolve meetings
  return deferred.promise

outputAll = (message) ->
  getAll(message).then (meetings) ->
    message.meetings = meetings
    meetingOutputter.output message

getOneByName = (name) ->
  deferred = q.defer()
  dbHandler.getOne(meetingDbName, name: name).then (meeting) ->
    deferred.resolve meeting
  return deferred.promise

exports = this
exports.create = create
exports.outputAll = outputAll
exports.getAll = getAll
exports.remove = remove
exports.getOneByName = getOneByName
