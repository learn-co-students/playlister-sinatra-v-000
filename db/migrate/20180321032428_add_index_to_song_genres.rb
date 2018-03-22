class AddIndexToSongGenres < ActiveRecord::Migration[5.1]
  def change
    add_index :song_genres, [:song_id, :genre_id]
  end
end
