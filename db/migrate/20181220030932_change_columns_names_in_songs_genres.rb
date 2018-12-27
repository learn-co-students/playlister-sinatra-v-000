class ChangeColumnsNamesInSongsGenres < ActiveRecord::Migration
  def change
    rename_column :songs_genres, :songs_id, :song_id
    rename_column :songs_genres, :genres_id, :genre_id
  end
end
