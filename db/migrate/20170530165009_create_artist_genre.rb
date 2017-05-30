class CreateArtistGenre < ActiveRecord::Migration
  def change
    create_table :artist_genres do |t|
      t.integer :artist_id
      t.integer :genre_id
    end
  end
end
