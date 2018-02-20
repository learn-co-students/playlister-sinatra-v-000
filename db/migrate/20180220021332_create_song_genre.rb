class CreateSongGenre < ActiveRecord::Migration
  def change
    create_tables :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
