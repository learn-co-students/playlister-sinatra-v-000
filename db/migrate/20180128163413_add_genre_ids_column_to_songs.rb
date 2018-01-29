class AddGenreIdsColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :genre_ids, :string
  end
end
