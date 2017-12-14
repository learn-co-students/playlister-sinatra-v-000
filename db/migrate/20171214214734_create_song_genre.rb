class CreateSongGenre < ActiveRecord::Migration
  def change
    create_table :songs_genres |t| do
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
