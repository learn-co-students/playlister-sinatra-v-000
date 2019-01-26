class CreateJoinTableGenresSongs < ActiveRecord::Migration
  def change
  	create_join_table :genres, :songs
  end
end
