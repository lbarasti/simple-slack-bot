require 'slack-ruby-bot'
Dir.entries('commands')
   .grep(/\.rb/)
   .grep_v(/help\.rb/)
   .each {|command| require_relative "commands/#{command}"}
require_relative 'commands/help' # please make sure the help command is loaded last

SlackRubyBot.configure do |config|
  config.send_gifs = false
end

module SimpleBot
  class Bot < SlackRubyBot::Bot
  end
end

SimpleBot::Bot.run