class ChangeColNameOnArtists < ActiveRecord::Migration
  def change
    rename_column :artists, :slug, :url_slug
  end
end
