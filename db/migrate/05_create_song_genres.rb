class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.string :songs_id
      t.string :genres_id
    end
  end
end
