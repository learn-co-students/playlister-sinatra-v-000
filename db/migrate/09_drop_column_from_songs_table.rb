class DropColumnFromSongsTable < ActiveRecord::Migration[4.2]
  def change
    remove_column :songs, :artist
  end
end 
