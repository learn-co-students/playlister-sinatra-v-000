class CreateSonggenres < ActiveRecord::Migration
  def change
    create_table :songgenres do |t|
      t.string :songs
      t.string :genres
      t.string :song_id
      t.string :genre_id
    end
  end
end
