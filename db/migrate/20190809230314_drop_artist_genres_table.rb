class DropArtistGenresTable < ActiveRecord::Migration[5.2]
  def up 
    drop_table :artist_genres
  end
  
  def down
    create_table :artist_genres do |t|
      t.integer :artist_id
      t.integer :genre_id
    end
  end
end
