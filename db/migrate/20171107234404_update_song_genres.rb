class UpdateSongGenres < ActiveRecord::Migration
  def change
    rename_table :songsgenres, :song_genres
  end
end
