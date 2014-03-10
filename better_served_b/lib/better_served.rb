require 'pusher-client'
class BetterServed

  LOGIN = "christoph@vedanova.com"
  ACCOUNT = "vedanova"
  API_KEY = "fad5ae28dbb7ec8973d5"
  API_SECRET = "7bcbe57b920af30231cb"
  NOTIFICATION_CHANNEL = "#{ACCOUNT}_notifications"
  PRIVATE_NOTIFICATION_CHANNEL = "private-#{ACCOUNT}_notifications"
  USER_ID = "XYZ"

  def connect_asyncronous

    socket = PusherClient::Socket.new(API_KEY)
    socket.connect(true) # Connect asynchronously

    # Subscribe to two channels
    socket.subscribe(NOTIFICATION_CHANNEL)

    # Bind to a global event (can occur on either channel1 or channel2)
    socket.bind('globalevent') do |data|
      puts data
    end

    # Bind to a channel event (can only occur on channel1)
    socket[NOTIFICATION_CHANNEL].bind('channelevent') do |data|
      puts data
    end

    loop do
      sleep(1) # Keep your main thread running
    end
  end

  def connect
    options = {:secret => API_SECRET}
    socket = PusherClient::Socket.new(API_KEY, options)

    # Subscribe to two channels
    socket.subscribe(NOTIFICATION_CHANNEL)
    #socket.subscribe('channel2')

    # Subscribe to presence channel
    #socket.subscribe('presence-channel3', USER_ID)

    # Subscribe to private channel
    socket.subscribe(PRIVATE_NOTIFICATION_CHANNEL, USER_ID)

    # Subscribe to presence channel with custom data (user_id is mandatory)
    #socket.subscribe('presence-channel5', :user_id => USER_ID, :user_name => 'john')

    # Bind to a global event (can occur on either channel1 or channel2)
    socket.bind('globalevent') do |data|
      puts data
    end

    # Bind to a channel event (can only occur on channel1)
    socket[PRIVATE_NOTIFICATION_CHANNEL].bind('channelevent') do |data|
      puts data
    end

    socket.connect
  end
end

BetterServed.new.connect