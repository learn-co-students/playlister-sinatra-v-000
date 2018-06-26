class RenameSongsColumn < ActiveRecord::Migration
  def change
    rename_column :songs, :artist, :artist_id
  end
end
