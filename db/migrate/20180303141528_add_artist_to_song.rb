class AddArtistToSong < ActiveRecord::Migration
  def change
  	rename_column :songs, :artist_id, :artist
  end
end
