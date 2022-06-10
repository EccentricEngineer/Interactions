class AddAccessTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :access_token, :string
    add_column :users, :instagram_user_id, :string
  end
end
