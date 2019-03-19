class AddColumnToGenresTable < ActiveRecord::Migration[4.2]
  add_column :genres, :song_id, :integer
  add_column :genres, :artist_id, :integer
end
