class DropTableGenresSongsAgain < ActiveRecord::Migration
  def change
  	drop_table :genres_songs
  end
end
