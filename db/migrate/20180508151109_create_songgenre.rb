class CreateSonggenre < ActiveRecord::Migration[5.1]
  def change
    create_join_table :songs, :genres
  end
end
