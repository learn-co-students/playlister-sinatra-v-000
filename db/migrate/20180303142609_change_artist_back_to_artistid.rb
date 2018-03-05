class ChangeArtistBackToArtistid < ActiveRecord::Migration
  def change
  	rename_column :songs, :artist, :artist_id
  	change_column :songs, :artist_id, :integer
  end
end
