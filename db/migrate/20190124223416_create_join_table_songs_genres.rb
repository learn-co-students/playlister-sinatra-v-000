class CreateJoinTableSongsGenres < ActiveRecord::Migration
  def change
  	create_join_table :songs, :genres
  end
end
