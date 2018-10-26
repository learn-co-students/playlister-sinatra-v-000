class AddSlugToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :slug, :string
  end
end
