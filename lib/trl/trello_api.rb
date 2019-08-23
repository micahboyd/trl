require 'trello'
require 'dotenv'

Dotenv.load

Trello.configure do |config|
  config.developer_public_key = ENV['DEVELOPER_PUBLIC_KEY']
  config.member_token = ENV['MEMBER_TOKEN']
end
