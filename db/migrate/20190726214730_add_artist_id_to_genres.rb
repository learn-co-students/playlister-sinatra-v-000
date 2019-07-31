class AddArtistIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :artist_id, :integer
  end
end
