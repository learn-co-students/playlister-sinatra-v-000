class RemoveSlugColumns < ActiveRecord::Migration
  def change
    remove_column :artists, :slug
    remove_column :genres, :slug
    remove_column :songs, :slug
  end
end
