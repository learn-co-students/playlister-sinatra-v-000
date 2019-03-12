class CreateSonggenres < ActiveRecord::Migration #join table here
  def change
    create_table :song_genres do |t|
      t.string :songs
      t.string :genres
      t.string :song_id
      t.string :genre_id
    end
  end
end
