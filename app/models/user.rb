class User < ApplicationRecord
  def self.from_omniauth(auth)
    user = find_or_create_by(provider: auth.provider, uid: auth.uid)
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.token = auth.credentials.token
      user.token_secret = auth.credentials.secret
      user.save!
      user

  end
end
