class RemoveArtistidSonggenre < ActiveRecord::Migration
  def change
    remove_column :song_genres, :artist_id
  end

end
