class CreateArtistGenres < ActiveRecord::Migration[4.2]
  def change
    create_table :artist_genres do |t|
      t.integer :artist_id
      t.integer :genre_id
      t.timestamps null: false
    end
  end
end
