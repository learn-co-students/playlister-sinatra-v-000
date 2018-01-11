class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.integer :song_id, index: true
      t.integer :genre_id, index: true
    end
  end
end
