class CreateSongGenres < ActiveRecord::Migration
  def change
      create_table :song_genres do |t|
        t.string :song_id
        t.string :genre_id
    end
  end
end
