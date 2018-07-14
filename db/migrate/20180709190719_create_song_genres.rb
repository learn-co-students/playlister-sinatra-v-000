class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |s|
      s.integer :song_id
      s.integer :genre_id
    end
  end
end
