class CreateSonggenre < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
       t.integer :genre_id
        t.integer :artist_id
    end
  end
end
