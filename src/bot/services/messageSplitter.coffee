split = (text) ->
  baseMessageSplit = text.split '>:'
  if baseMessageSplit.length < 2
    baseMessageSplit = text.split '>'

  if baseMessageSplit.length < 2
    return false
  userIdSection = baseMessageSplit[0]
  obj =
    messageTextSections: baseMessageSplit[1].trim().split(' ')
    userId: userIdSection.replace('<@', '')
  return obj

exports = this
this.split = split
