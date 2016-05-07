require 'slack-ruby-bot'

SlackRubyBot.configure do |config|
  config.send_gifs = false
end

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

PongBot.run