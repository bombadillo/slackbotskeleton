Slack = require 'slack-client'
config = require '../../common/config/index'

slackToken = config.botApiToken
autoReconnect = true
autoMark = true

slack = new Slack(slackToken, autoReconnect, autoMark)

module.exports = slack
