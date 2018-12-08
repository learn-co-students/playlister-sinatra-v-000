class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |sg|
      sg.string :song_id
      sg.string :genre_id
    end
  end
end
