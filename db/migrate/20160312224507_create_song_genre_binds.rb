class CreateSongGenreBinds < ActiveRecord::Migration
  def change
    create_table :song_genre_binds do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
