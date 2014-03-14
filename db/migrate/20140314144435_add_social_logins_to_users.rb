class AddSocialLoginsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :provider_id, :string
    add_column :users, :key, :string
    add_column :users, :secret, :string
  end
end
