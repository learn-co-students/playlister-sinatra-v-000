class AddArtistIdToGenres < ActiveRecord::Migration[4.2]
  def change
    add_column :genres, :artist_id, :integer
  end
end
