class ChangeGenresSongsTable < ActiveRecord::Migration
  def change
    rename_table :genres_songs, :song_genres
  end
end
