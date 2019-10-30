class CreateSongGenres < ActiveRecord::Migration[4.2]
  def change
    create_table :song_genres do |song_genre|
      song_genre.integer :song_id
      song_genre.integer :genre_id
    end
  end
end
