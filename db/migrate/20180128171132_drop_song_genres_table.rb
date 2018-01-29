class DropSongGenresTable < ActiveRecord::Migration
  def change
    drop_table :song_genres
  end
end
