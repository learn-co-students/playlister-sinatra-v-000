class CreateArtistGenresTable < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_genres do |t|
      t.integer :artist_id
      t.integer :genre_id
    end
  end
end