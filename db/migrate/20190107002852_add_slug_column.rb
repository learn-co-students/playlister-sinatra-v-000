class AddSlugColumn < ActiveRecord::Migration
  def change
    add_column :artists, :slug, :string
    add_column :genres, :slug, :string
    add_column :songs, :slug, :string
  end
end
