class Songs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.integer :genre_ids
      t.timestamps null: false
    end
  end
end
