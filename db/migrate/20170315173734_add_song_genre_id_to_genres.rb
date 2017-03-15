class AddSongGenreIdToGenres < ActiveRecord::Migration
  def change
      rename_column :genres, :song_id, :song_genre_id
  end
end
