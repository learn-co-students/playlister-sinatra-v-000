class CreateSongGenresTable < ActiveRecord::Migration[4.2]
  create_table :song_genres do |t|
    t.integer :song_id
    t.integer :genre_id
  end
end
