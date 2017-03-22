class RemoveColumnsFromSongGenres < ActiveRecord::Migration
  def change
    remove_columns(:song_genres, :song_id, :genre_id)
  end
end
