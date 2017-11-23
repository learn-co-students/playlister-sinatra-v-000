class CreateSongGenreTable < ActiveRecord::Migration
  def change
    create_table :song_genres, id: false do |t|
      t.integer :song_id
      t.integer :genre_id
    end
    add_index :song_genres, :song_id
    add_index :song_genres, :genre_id
  end


end
