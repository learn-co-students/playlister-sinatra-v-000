class AddGenresIdToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :genres_id, :integer
  end
end
