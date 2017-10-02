class RemoveSlugFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :slug 
  end
end
