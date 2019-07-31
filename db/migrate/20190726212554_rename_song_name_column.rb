class RenameSongNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :songs, :song_name, :name
  end
end
