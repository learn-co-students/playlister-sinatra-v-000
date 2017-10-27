class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |sg|
      sg.integer :song_id
      sg.integer :genre_id
    end
  end
end
