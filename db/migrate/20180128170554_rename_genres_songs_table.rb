class RenameGenresSongsTable < ActiveRecord::Migration
  def change
    rename_table :genres_songs, :song_genres
  end
end
