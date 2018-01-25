class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.integer :song_genre_id
    end
  end
end
