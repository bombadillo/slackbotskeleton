slack = require './services/slack/slackClient'
messager = require './services/slack/messager'
log = require '../common/services/log'

start = ->
  slack.on 'open', ->
    log.info "Connected to slack"

  slack.on 'message', (message) ->
    console.log message
    messager.sendMessage 'got ya', message.channel

  slack.on 'error', (err) ->
    log.error "Error", err

  slack.login()

exports = this
exports.start = start