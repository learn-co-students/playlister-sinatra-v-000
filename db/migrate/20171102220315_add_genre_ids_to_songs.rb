class AddGenreIdsToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :genre_ids, :integer
  end
end
