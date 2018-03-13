class FixSongGenres < ActiveRecord::Migration[5.1]
  def change
  	remove_column :song_genres, :artist_id, :integer
  	add_column :song_genres, :song_id, :integer
  end
end
