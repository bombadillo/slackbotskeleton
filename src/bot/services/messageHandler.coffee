log = require '../../common/services/log'

handle = (message) ->
  log.debug 'Message received'

exports = this
exports.handle = handle
