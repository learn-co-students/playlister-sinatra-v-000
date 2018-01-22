class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.string :song_id
      t.string :genre_id
      t.string :genre
    end
  end
end
