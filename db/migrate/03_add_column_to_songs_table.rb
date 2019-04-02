class AddColumnToSongsTable < ActiveRecord::Migration[4.2]
  add_column :songs, :artist_id, :integer
end
