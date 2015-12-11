slack = require './services/slackClient'
messageHandler = require './services/messageHandler'
log = require '../common/services/log'

start = ->

  slack.on 'open', ->
    log.info "Connected to #{slack.team.name} as @#{slack.self.name}"

  slack.on 'message', (message) ->
    console.log message
    messageHandler.handle message

  slack.on 'error', (err) ->
    console.error "Error", err

  slack.login()

exports = this
exports.start = start
