class AddArtistIdToSongGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :song_genres, :artist_id, :integer
  end
end
