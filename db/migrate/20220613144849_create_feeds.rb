class CreateFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :feeds do |t|
      t.text :caption
      t.string :media_id
      t.string :media_type
      t.string :media_url
      t.string :permalink
      t.string :thumbnail_url
      t.string :timestamp
      t.string :username
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
