class AddGenreIdToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :genre_id, :integer
  end
end
