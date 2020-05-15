class CreateSongGenres < ActiveRecord::Migration[5.2]
  def change
     create_table :song_genres do |t|
      t.interger :song_id
      t.interger :genre_id
    end
  end
end
