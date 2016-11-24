Rails.application.config.middleware.use OmniAuth::Builder do
    provider :fiveHundredPx, ENV.fetch('CONSUMER_KEY'), ENV.fetch('CONSUMER_SECRET')
end
