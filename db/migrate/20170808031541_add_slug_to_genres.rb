class AddSlugToGenres < ActiveRecord::Migration
  def change
  	add_column :genres, :slug_string, :string
  end
end
