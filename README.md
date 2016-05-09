# Development
### Run and restart on changes
Remember to export your SLACK_API_KEY
```
export SLACK_API_KEY=...
```
then
```
find ./commands/*.rb ./bot.rb -type f | entr -r bundle exec ruby bot.rb
```

### Adding commands
Add a file to the `commands` folder with the structure
```
module SimpleBot
  module Commands
    class Help < SlackRubyBot::Commands::Base
      command 'your_new_command' do |client, data, match|
        # something ending with client.say(...)
      end
      def self.help
        "A handy help message for the command"
      end
    end
  end
end
```
