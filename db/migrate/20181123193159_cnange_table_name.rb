class CnangeTableName < ActiveRecord::Migration
  def change
    rename_table :song_genre, :song_genres
  end
end
