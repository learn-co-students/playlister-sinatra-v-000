class AddSongGenreIdToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :song_genre_id, :integer
  end
end
