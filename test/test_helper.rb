require_relative '../bot.rb'
require 'minitest/autorun'

Msg = Struct.new(:text, :channel, :user)

class ClientMock < SlackRubyBot::Client
  attr_reader :last
  def initialize(name)
    super(aliases: name)
  end
  def say(smth)
    @last = smth
  end
end

def describe_command command, &block
  describe "#{command}" do
    Runner.new(self, command).instance_eval &block
  end
end

class Runner
  def initialize context, command
    @context = context
    @command = command
  end
  def on message, &block
    command = @command
    @context.it "#{message}" do
      client = ClientMock.new('test_client')
      command.invoke(client, Msg.new(message, "channel", "user"))
      block.call client.last
    end
  end
end
