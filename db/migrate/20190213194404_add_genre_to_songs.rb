class AddGenreToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :genre_ids, :integer
  end
end
