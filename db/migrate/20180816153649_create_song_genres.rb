class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genre do |t|
      t.integer :song_id
      t.integer :genre_id
    end 
  end
end
