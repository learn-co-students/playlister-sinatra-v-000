class AddSlugToArtists < ActiveRecord::Migration
  def change
  	add_column :artists, :slug_string, :string
  end
end
