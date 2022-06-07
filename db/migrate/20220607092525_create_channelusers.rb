class CreateChannelusers < ActiveRecord::Migration[6.1]
  def change
    create_table :channelusers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
