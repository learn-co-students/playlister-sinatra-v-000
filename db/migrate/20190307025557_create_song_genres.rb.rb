class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |i|
      i.integer :song_id
      i.integer :genre_id
    end
  end
end