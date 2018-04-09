class AddGenreIdColumnInArtists < ActiveRecord::Migration[5.1]
  def change
    add_column(:artists, :genre_id, :integer)
  end
end
