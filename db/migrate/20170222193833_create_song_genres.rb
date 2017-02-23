class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |column|
      column.integer :song_id
      column.integer :genre_id
    end
  end
end
