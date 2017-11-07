class RemoveSlugFromSongs < ActiveRecord::Migration[5.1]
  def change
    remove_column :songs, :slug, :string
  end
end
