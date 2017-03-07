class CreateSongGenre < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.references :song, foreign_key: true
      t.references :genre, foreign_key: true
    end
  end

  def down
    drop_table :songs
  end
end
