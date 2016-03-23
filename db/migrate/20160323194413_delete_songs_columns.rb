class DeleteSongsColumns < ActiveRecord::Migration
  def change
    remove_column :songs, :artist_id
    remove_column :songs, :genre_ids
  end
end
