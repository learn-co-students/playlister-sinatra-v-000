class CreateSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :song_genres
      t.integer :artist_id
      t.integer :genre_id
    end
  end
end