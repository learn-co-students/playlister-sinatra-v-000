class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |c|
      c.integer :song_id
      c.integer :genre_id
    end
  end
end
