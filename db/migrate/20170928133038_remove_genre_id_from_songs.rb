class RemoveGenreIdFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :genre_id
  end
end
