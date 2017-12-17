class CreateSongGenre < ActiveRecord::Migration
  def change
    create_table :songs, :genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
