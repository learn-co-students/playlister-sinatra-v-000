class AddSlugToArtists < ActiveRecord::Migration
  def up
    add_column :artists, :slug, :string
  end

  def down
    remove_column :artists, :slug
  end
end
