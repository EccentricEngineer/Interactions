class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.text :name
      t.integer :price
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
