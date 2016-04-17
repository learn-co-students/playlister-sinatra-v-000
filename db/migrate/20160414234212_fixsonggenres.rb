class Fixsonggenres < ActiveRecord::Migration
  def change

    drop_table :songs_genres

    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
