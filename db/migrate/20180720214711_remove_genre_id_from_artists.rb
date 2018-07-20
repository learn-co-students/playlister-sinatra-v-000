class RemoveGenreIdFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :genre_id, :integer
  end
end
