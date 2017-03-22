class ChangeColumnsInSongGenres < ActiveRecord::Migration
  def change
    remove_column :song_genres, :artist_id
    add_column :song_genres, :genre_id, :integer
  end
end
