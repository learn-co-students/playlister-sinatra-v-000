class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
