class ChangeSongsGenresToSongGenres < ActiveRecord::Migration[5.1]
  def change
    rename_table :songs_genres, :song_genres 
  end
end
