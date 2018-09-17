class CreateJoinTableSongGenre < ActiveRecord::Migration
  def change
    create_join_table :songs, :genres, table_name: 'song_genres'
  end
end
