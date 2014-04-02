# http://rubygems.org/gems/pusher
require 'pusher'

PUSHER_REQUEST_CHANNEL = 'request_channel'

Pusher.app_id = ENV['PUSHER_APP_ID']
Pusher.key = ENV['PUSHER_KEY']
Pusher.secret = ENV['PUSHER_APP_SECRET']
