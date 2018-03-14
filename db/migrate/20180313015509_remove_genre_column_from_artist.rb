class RemoveGenreColumnFromArtist < ActiveRecord::Migration[5.1]
  def change
    remove_column :artists, :genre
  end
end
