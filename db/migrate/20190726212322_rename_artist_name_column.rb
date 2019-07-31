class RenameArtistNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :artists, :artist_name, :name
  end
end
