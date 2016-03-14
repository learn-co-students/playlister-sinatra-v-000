class AddArtistIdToSongsGenres < ActiveRecord::Migration
  def change
    add_column :songs_genres, :artist_id, :integer
  end
end
