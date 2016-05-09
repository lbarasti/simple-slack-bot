require 'slack-ruby-bot'
require_relative 'commands/help' # please make sure the help command is loaded last

SlackRubyBot.configure do |config|
  config.send_gifs = false
end

module SimpleBot
  class Bot < SlackRubyBot::Bot
  end
end

SimpleBot::Bot.run