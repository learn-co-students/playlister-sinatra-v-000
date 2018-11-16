class CreateSongGenres < ActiveRecord::Migration
  def change
    # create_join_table :songs, :genres
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
