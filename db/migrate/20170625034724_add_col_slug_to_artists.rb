class AddColSlugToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :slug, :text
  end
end
