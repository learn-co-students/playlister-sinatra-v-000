class ChangeArtistTablename < ActiveRecord::Migration[5.2]
  def change
    rename_table :artist, :artists
  end
end
