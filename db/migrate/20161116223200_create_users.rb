class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :token_secret
      t.datetime :omnniauth_expires_at

      t.timestamps
    end
  end
end
