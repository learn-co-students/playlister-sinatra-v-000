class CreateSongsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :genre
      t.integer :artist_id
      t.integer :genre_id
    end
  end
end
