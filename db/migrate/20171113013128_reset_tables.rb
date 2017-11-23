class ResetTables < ActiveRecord::Migration
  def change
    drop_table :artists_genres
    remove_column :genres, :artist_id, :integer
    remove_column :artists, :genre_id, :integer
    remove_column :artists, :song_id, :integer
  end
end
