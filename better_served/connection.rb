require 'pusher-client'

class Connection
  LOGIN = "christoph@vedanova.com"
  ACCOUNT = "vedanova"
  API_KEY = "fad5ae28dbb7ec8973d5"
  API_SECRET = "7bcbe57b920af30231cb"
  NOTIFICATION_CHANNEL = "#{ACCOUNT}_notifications"
  PRIVATE_NOTIFICATION_CHANNEL = "private_#{ACCOUNT}_notifications"
  USER_ID = "XYZ"

  def connect
    options = {:secret => API_SECRET}
    socket = PusherClient::Socket.new(API_KEY, options)

    log_connection(socket)

    channel = socket.subscribe(PRIVATE_NOTIFICATION_CHANNEL, USER_ID)

    channel.bind('action') do |data|
      d = JSON.parse(data)
      message = d["message"]
      puts message
    end
    socket.connect
  end

  def log_connection(socket)
    socket.bind('pusher:connection_established') do |data|
      puts "Connection established"
    end

    socket[PRIVATE_NOTIFICATION_CHANNEL].bind('pusher_internal:subscription_succeeded') do |event|
      puts "1 successful connected to #{PRIVATE_NOTIFICATION_CHANNEL}"
    end

    socket[PRIVATE_NOTIFICATION_CHANNEL].bind('pusher_internal:subscription_error') do |event|
      puts "ERROR unsuccessful connected to #{PRIVATE_NOTIFICATION_CHANNEL}"
    end

  end

end

Connection.new.connect