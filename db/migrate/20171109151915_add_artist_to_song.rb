class AddArtistToSong < ActiveRecord::Migration
  def up
    add_column :songs, :artist, :string
  end

  def down
    remove_column :songs, :artist, :string
  end
end
