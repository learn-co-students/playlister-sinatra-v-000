class ChangeSongGenreToSongGenres < ActiveRecord::Migration[5.1]
  def change
    rename_table :song_genre, :song_genres
  end
end
