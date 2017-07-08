class CreateSongGenres < ActiveRecord::Migration
  def change #joins table
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
