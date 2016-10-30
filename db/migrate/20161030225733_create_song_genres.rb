class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.string :name
      t.integer :genre_id
      t.integer :song_id
    end
  end
end
