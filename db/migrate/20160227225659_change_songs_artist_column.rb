class ChangeSongsArtistColumn < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.remove :artist 
      t.integer :artist_id
    end
  end
end
