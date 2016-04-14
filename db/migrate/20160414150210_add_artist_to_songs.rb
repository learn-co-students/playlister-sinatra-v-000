class AddArtistToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :artist, :string
  end
end
