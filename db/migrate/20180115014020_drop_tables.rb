class DropTables < ActiveRecord::Migration
  def change
    drop_table :songs
    drop_table :artists
    drop_table :genres
    drop_table :song_genres
  end
end
