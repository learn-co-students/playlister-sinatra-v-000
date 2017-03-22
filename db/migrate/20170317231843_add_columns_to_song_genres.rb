class AddColumnsToSongGenres < ActiveRecord::Migration
  def change
    add_column :song_genres, :song_id, :integer
    add_column :song_genres, :artist_id, :integer
  end
end
