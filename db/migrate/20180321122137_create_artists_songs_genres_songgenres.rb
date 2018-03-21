class CreateArtistsSongsGenresSonggenres < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
    end
  end
  
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end
  end
  
  def change
    create_table :genres do |t|
      t.string :name
    end
  end
  
  def change
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
