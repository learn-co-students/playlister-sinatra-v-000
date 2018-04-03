class CreateSongGenresTable < ActiveRecord::Migration[5.1]
  def change
    create_table :song_genres do |t|
      t.string :name
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
