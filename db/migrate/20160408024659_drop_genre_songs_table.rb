class DropGenreSongsTable < ActiveRecord::Migration
  def change
    drop_table :genre_songs
  end
end
