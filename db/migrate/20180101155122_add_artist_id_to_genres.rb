class AddArtistIdToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :artist_id, :integer
  end
end
