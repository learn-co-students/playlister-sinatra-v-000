class AddArtistsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :artists_id, :integer
  end
end
