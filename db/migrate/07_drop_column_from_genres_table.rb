class DropColumnFromGenresTable < ActiveRecord::Migration[4.2]
  remove_column :genres, :song_id
  remove_column :genres, :artist_id
end
