class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provideruser
      user.uid = auth.uid
      user.name = auth.info.name
      user.token = auth.credentials.token
      user.secret = auth.credentials.token_secret
      user.omniauth_expries_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
