class AddSlugToAllTables < ActiveRecord::Migration
  def change
    add_column :songs, :slug_name, :string
    add_column :artists, :slug_name, :string
    add_column :genres, :slug_name, :string
  end
end
