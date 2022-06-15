class AddPhotoToRewards < ActiveRecord::Migration[6.1]
  def change
    add_column :rewards, :photo, :string
  end
end
