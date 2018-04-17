class AddArtistToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :artist_id, :integer #adding a column to the songs table of artist id and defining its type as an integer
  end
end
