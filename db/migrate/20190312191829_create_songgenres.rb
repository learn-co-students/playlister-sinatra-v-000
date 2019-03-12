class CreateSonggenres < ActiveRecord::Migration
  def change
    create_table :songgenres do |t|
      t.string :name
      t.string :songs
      t.string :artists
      t.string :song_id
      t.string :artist_id
  end
end
