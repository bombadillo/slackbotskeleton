messageSplitter = require './messageSplitter'

toObject = (text) ->
  split = messageSplitter.split(text)
  if !split
    return false
    
  action = getAction(split)
  valueString = getValues(split)

  obj =
    userId: split.userId
    action: action
    value: valueString
  return obj

getAction = (split) ->
  action = split.messageTextSections[0]
  if split.messageTextSections.length > 1
    action += split.messageTextSections[1]
  return action

getValues = (split) ->
  values = split.messageTextSections[2...split.length]
  valueString = ''
  for value in values
    valueString += "#{value} "
  valueString = valueString.slice 0, -1
  return valueString

exports = this
exports.toObject = toObject
