class ChangeColNameOnGenres < ActiveRecord::Migration
  def change
    rename_column :genres, :slug, :url_slug
  end
end
