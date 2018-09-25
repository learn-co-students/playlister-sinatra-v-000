class AddSongGenreToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_genre, :string
  end
end
