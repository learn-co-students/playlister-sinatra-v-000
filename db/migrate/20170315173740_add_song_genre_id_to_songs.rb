class AddSongGenreIdToSongs < ActiveRecord::Migration
  def change
      rename_column :songs, :genre_id, :song_genre_id
  end
end
