class AddColumnToSongGenres < ActiveRecord::Migration
  def up
    add_column :song_genres, :genre_ids, :integer
  end

  def down
    remove_column :songs_genres, :genre_ids, :integer
  end
end
