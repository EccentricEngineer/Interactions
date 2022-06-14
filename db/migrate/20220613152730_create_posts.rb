class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :url
      t.references :channel, null: false, foreign_key: true
      t.string :caption

      t.timestamps
    end
  end
end
