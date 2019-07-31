class DropTableSongs < ActiveRecord::Migration[5.2]
  def change
    drop_table :songs
  end
end
