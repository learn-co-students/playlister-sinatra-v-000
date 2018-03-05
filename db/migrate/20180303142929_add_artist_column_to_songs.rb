class AddArtistColumnToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :artist, :text
  end
end
