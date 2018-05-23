class ChangeColumnActorInSong < ActiveRecord::Migration
  remove_column :songs, :artist
  add_column :songs, :artist_id, :integer
end