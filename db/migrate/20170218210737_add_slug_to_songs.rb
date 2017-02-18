class AddSlugToSongs < ActiveRecord::Migration
  def up
    add_column :songs, :slug, :string
  end

  def down
    remove_column :songs, :slug
  end
end
