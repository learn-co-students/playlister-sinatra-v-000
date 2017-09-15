class CreateSongGenre < ActiveRecord::Migration
  def change
    create_table :song_genre do |t|
      t.integer :song_id, :null => false
      t.integer :genre_id, :null => false
    end
  end
end
