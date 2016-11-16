Rails.application.config.middleware.use OmniAuth::Builder do
    provider :fiveHundredPx, Rails.application.secrets.consumer_key, Rails.application.secrets.consumer_secret
end
