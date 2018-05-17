class CreateSongGenre < ActiveRecord::Migration[5.1]
  def change
    create_table :song_genre do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
