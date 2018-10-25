class CreateArtistgenre < ActiveRecord::Migration
  def change
    create_table :artist_genres do |t|
      t.integer :artist_id
      t.integer :song_id
    end
  end
end
