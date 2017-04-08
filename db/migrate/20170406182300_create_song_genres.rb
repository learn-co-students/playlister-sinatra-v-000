class CreateSongGenres < ActiveRecord::Migration #JOIN TABLE!
  def change
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
