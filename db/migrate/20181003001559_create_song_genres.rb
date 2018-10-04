class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :artist_id
   end
 end
end
