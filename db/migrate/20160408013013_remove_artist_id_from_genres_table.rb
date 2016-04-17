class RemoveArtistIdFromGenresTable < ActiveRecord::Migration
  def change
    remove_column(:genres, :artist_id)
  end
end
