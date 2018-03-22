class CreateJoinTableSongGenres < ActiveRecord::Migration[5.1]
  def change
    create_join_table :songs, :genres, table_name: :song_genres
  end
end
