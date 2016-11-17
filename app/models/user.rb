class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provideruser
      user.uid = auth.uid
      user.name = auth.info.name
      user.token = auth.credentials.token
      user.token_secret = auth.credentials.token_secret
      user.save!
    end
  end
end
