class AddArtistIdToGenres < ActiveRecord::Migration
  def up
    add_column :genres, :artist_id, :integer
  end

  def down
    remove_column :genres, :artist_id, :integer
  end
end
