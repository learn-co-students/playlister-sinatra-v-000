class RemGenreIdsFromSongGenres < ActiveRecord::Migration
  def up
    remove_column :song_genres, :genre_ids
  end

  def down
    add_column :song_genres, :genre_ids, :integer
  end
end
