class ResetAll < ActiveRecord::Migration
  def change
    drop_table :songs
    drop_table :genres
    drop_table :artists
    drop_table :artist_genres
  end
end
