class AddColumnsToChannel < ActiveRecord::Migration[6.1]
  def change
    add_column :channels, :description, :text
    add_column :channels, :photo_url, :text
  end
end
