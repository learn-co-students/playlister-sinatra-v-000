class RemoveArtistIdFromSongGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :song_genres, :artist_id
  end
end
