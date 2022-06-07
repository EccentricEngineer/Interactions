class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :profile_picture, :text
    add_column :users, :ig_tag, :string
  end
end
