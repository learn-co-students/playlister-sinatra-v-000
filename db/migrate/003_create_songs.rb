class CreateSongs < ActiveRecord::Migration[4.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.integer :genre_ids
      t.integer :artist_id
    end
  end
end