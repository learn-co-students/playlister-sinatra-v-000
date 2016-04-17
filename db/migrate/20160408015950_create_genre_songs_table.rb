class CreateGenreSongsTable < ActiveRecord::Migration
  def change
    create_table :genre_songs, :id => false do |t|
      t.integer :genre_id
      t.integer :song_id
    end
  end
end
