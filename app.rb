
require 'slackbotsy'
require 'sinatra'
require 'open-uri'

config = {
  'team'           => 'skyack',
  'channel'        => '#general',
  'name'           => 'skyack',
  'incoming_token' => 'secret',
  'outgoing_token' => 'secret'
}

bot = Slackbotsy::Bot.new(config) do

  hear /echo\s+(.+)/ do |data, mdata|
    "I heard #{data['user_name']} say '#{mdata[1]}' in #{data['channel_name']}"
  end

  hear /flip out/i do
    open('http://tableflipper.com/gif') do |f|
      "<#{f.read}>"
    end
  end

end

post '/' do
  bot.handle_item(params)
end
