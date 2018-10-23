class RenameTable < ActiveRecord::Migration
  def change
    rename_table :song_genres, :song_genre
  end 
end