class RenameSongsGenresTable < ActiveRecord::Migration
  def change
    rename_table :songs_genres, :song_genres
  end
end
