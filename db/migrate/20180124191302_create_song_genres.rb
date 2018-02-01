class CreateSongGenres < ActiveRecord::Migration
  def up
    create_table :song_genres do |t|
      t.integer :song
      t.integer :genre
    end
  end

  def down
    drop_table :song_genres
  end
end
