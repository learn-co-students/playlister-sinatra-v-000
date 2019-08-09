class DropArtistGenresTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :artist_genres
  end
end