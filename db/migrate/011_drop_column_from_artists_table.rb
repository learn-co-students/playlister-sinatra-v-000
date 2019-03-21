class DropColumnFromArtistsTable < ActiveRecord::Migration[4.2]
  def change
    remove_column :artists, :genre_id
  end
end
