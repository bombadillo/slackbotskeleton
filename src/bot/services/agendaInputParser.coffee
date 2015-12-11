parse = (text) ->
  messageSplit = text.split(' to meeting ')
  obj =
    agendaName: messageSplit[0]
    meetingName: messageSplit[1]
  return obj

exports = this
exports.parse = parse
