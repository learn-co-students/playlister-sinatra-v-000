class RemoveArtistsgenres < ActiveRecord::Migration
  def change
    drop_table :artists_genres
  end
end
