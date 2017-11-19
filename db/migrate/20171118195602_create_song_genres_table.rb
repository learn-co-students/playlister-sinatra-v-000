class CreateSongGenresTable < ActiveRecord::Migration[5.1]
  def change
    create_table :songgenres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
