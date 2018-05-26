class CreateNewSongGenresTable < ActiveRecord::Migration
  def change
    drop_table :songgenres
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
