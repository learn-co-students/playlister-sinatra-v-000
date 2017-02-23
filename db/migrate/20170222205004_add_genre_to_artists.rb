class AddGenreToArtists < ActiveRecord::Migration
  def change
     add_column :artists, :genres, :string
  end
end
