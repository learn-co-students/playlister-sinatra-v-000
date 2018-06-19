class AddSlugToAllTables < ActiveRecord::Migration
  def change
    add_column :songs, :slug, :string
    add_column :artists, :slug, :string
    add_column :genres, :slug, :string
  end
end
