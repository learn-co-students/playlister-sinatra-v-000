class CreateSongsArtists < ActiveRecord::Migration
  def change
    create_table :song_artists do |t|
      t.integer :song_id
      t.integer :artist_id
  end
end
