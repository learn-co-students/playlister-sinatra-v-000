class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.integer :artist_id
      t.integer :song_id
    end
  end
end
