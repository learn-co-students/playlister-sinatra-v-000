class RemoveSlugColumns < ActiveRecord::Migration
  def change
    remove_column :songs, :slug
    remove_column :artists, :slug
  end
end
