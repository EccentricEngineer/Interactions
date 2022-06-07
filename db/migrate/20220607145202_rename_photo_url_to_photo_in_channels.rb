class RenamePhotoUrlToPhotoInChannels < ActiveRecord::Migration[6.1]
  def change
    rename_column :channels, :photo_url, :photo
  end
end
