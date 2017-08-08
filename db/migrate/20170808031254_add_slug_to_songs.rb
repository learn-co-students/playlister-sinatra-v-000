class AddSlugToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :slug_string, :string
  end
end
