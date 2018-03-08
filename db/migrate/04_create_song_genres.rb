class CreateSongGenres < ActiveRecord::Migration[4.2]
  def change
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end