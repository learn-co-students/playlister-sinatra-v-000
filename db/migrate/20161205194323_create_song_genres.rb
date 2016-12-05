class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.string :name
      t.string :genre_id
      t.string :song_id
    end
  end
end
