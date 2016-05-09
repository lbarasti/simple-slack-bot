module SimpleBot
  module Commands
    class Help < SlackRubyBot::Commands::Base
      command 'help' do |client, data, _match|
        msg = help_messages
        client.say(channel: data.channel, text: msg)
      end
      def self.help_messages
        Commands.constants.map{|cmd|
          obj = Commands.const_get(cmd)
          obj.respond_to?(:help) ? obj.help : "#{cmd}: no docs available"
        }
      end
    end
  end
end