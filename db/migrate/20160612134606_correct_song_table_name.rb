class CorrectSongTableName < ActiveRecord::Migration
  def change
    rename_table :song_geners, :song_genres
  end
end
