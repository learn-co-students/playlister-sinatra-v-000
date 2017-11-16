class AddArtistIdColumn < ActiveRecord::Migration
  def change
    add_column :songs, :artist_id, :integer
    remove_column :songs, :artist
  end
end
