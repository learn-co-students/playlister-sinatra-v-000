class CreateSongGenres < ActiveRecord::Migration
  def change
    create_join_table :songs, :genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
