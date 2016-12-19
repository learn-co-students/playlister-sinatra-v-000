class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.text :song_id
      t.text :genre_id
    end
  end
end
