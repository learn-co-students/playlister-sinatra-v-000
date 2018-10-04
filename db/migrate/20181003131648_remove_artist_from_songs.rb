class RemoveArtistFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :artist
  end


def down
  drop_table :songs
end
end
