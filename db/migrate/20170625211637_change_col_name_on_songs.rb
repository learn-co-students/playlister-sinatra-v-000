class ChangeColNameOnSongs < ActiveRecord::Migration
  def change
    rename_column :songs, :slug, :url_slug
  end
end
