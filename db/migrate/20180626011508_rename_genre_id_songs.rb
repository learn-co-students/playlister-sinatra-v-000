class RenameGenreIdSongs < ActiveRecord::Migration
  def change
    rename_column :songs, :genre_ids, :genre_id
  end
end
