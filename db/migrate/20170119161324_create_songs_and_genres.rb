class CreateSongsAndGenres < ActiveRecord::Migration
  def change
    create_table :songsandgenres do |t|
      t.integer :song_id
      t.integer :genre_id
    end 
  end
end
