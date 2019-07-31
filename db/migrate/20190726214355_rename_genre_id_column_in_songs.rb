class RenameGenreIdColumnInSongs < ActiveRecord::Migration[5.2]
  def change
    rename_column :songs, :genre_id, :genre_ids
  end
end
