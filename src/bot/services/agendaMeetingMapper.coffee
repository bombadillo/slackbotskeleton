agendaHandler = require './agendaHandler'
q = require 'q'
meetingMapIndex = 0

map = (meetings, deferred) ->
  deferred = if deferred then deferred else q.defer()
  mapMeeting(meetings[meetingMapIndex]).then (mappedMeeting) ->
    meeting = mappedMeeting
    if meetingMapIndex == meetings.length
      meetingMapIndex = 0
      deferred.resolve meetings
    else
      map(meetings, deferred)
  return deferred.promise

mapMeeting = (meeting) ->
  deferred = q.defer()
  agendaHandler.getAllForMeeting(meeting.name).then (agendas) ->
    meeting.agendas = agendas
    meetingMapIndex++
    deferred.resolve meeting
  return deferred.promise

exports = this
exports.map = map
