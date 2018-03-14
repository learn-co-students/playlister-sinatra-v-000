class ChangeArtistToArtistIdInSongs < ActiveRecord::Migration[5.1]
  def change
    rename_column :songs, :artist, :artist_id
  end
end
