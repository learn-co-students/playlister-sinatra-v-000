class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |s|
      s.integer :genre_id
      s.integer :song_id
    end
  end
end