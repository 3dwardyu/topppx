class RemoveOmniauthexpiresatFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :omnniauth_expires_at, :datetime
  end
end
