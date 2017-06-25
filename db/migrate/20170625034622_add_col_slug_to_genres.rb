class AddColSlugToGenres < ActiveRecord::Migration
  def change
    add_column :genres, :slug, :text
  end
end
