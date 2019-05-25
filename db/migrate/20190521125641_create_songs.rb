class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      # t.integer :artist_id # this doesn't work, need to AddArtistToSongs
    end
  end
end