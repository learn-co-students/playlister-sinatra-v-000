class RemoveGenreIdsAndSongIds < ActiveRecord::Migration
  def change
    remove_column :artists, :genre_ids
    remove_column :artists, :song_ids
    remove_column :genres, :artist_ids
    remove_column :songs, :genre_ids
    remove_column :songs_genres, :artist_id
  end
end
