class DropSongGenre < ActiveRecord::Migration
  def up
    drop_table :song_genres
  end
  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
