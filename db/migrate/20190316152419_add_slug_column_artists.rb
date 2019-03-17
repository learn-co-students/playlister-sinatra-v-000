class AddSlugColumnArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :slug, :string
  end
end
