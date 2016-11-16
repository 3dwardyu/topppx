F00px.configure do |config|
<<<<<<< HEAD
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
=======
  config.consumer_key = Rails.application.secrets.consumer_key
  config.consumer_secret = Rails.application.secrets.consumer_secret
>>>>>>> photo-showcase
end
