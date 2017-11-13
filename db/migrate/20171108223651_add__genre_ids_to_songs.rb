class AddGenreIdsToSongs < ActiveRecord::Migration
  def up
    add_column :songs, :genre_ids, :integer
  end

  def down
    remove_column :songs, :genre_ids, :integer
  end
end
