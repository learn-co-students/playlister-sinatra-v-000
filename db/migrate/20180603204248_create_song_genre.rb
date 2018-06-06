class CreateSongGenre < ActiveRecord::Migration
  def change
    create_table :songgenre do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
