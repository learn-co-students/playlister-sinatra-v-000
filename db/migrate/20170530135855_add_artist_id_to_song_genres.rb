class AddArtistIdToSongGenres < ActiveRecord::Migration
  def change
    add_column :song_genres, :artist_id, :integer
  end
end
