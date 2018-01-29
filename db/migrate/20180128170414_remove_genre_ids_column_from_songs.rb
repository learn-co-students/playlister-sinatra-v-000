class RemoveGenreIdsColumnFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :genre_ids
  end
end
