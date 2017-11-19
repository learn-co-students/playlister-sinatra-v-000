class RefineTablesNamesAndAttributes < ActiveRecord::Migration[5.1]
  def change
    rename_table :songgenres, :song_genres
    remove_columns :songs, :genre_id
  end
end
