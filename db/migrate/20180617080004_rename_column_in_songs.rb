class RenameColumnInSongs < ActiveRecord::Migration
  def change
    rename_column :songs, :title, :name 
  end
end
