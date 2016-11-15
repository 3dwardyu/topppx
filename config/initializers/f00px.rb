F00px.configure do |config|
  config.consumer_key = ENV.fetch("CONSUMER_KEY")
  config.consumer_secret = ENV.fetch("CONSUMER_SECRET")
end
