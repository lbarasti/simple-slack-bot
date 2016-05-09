module SimpleBot
  module Commands
    class Default < SlackRubyBot::Commands::Base
      command 'about'
      match(/^(?<bot>[[:alnum:][:punct:]@<>]*)$/u)

      def self.call(client, data, _match)
        client.say(channel: data.channel, text: "About here")
      end

      def self.help
        "about: prints info about the bot"
      end
    end
  end
end