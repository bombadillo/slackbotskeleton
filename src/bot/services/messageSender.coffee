log = require '../../common/services/log'

send = (message) ->
  log.debug 'send message'

exports = this
exports.send = send
