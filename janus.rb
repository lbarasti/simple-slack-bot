require 'slack-ruby-bot'

SlackRubyBot.configure do |config|
  config.send_gifs = false
end

module SimpleBot
  class Bot < SlackRubyBot::Bot
  end
end

SimpleBot::Bot.run