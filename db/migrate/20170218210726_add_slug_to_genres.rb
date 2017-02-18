class AddSlugToGenres < ActiveRecord::Migration
  def up
    add_column :genres, :slug, :string
  end

  def down
    remove_column :genres, :slug
  end
end
