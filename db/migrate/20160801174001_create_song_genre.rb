class CreateSongGenre < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.integer :genre_ids
    end
  end
end
