class CreateSongArtists < ActiveRecord::Migration
  def change
    create_table :song_artists do |t|
      t.string :song_id
      t.string :artist_id
    end
  end
end
