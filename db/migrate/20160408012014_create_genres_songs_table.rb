class CreateGenresSongsTable < ActiveRecord::Migration
  def change
    create_table :genres_songs, :id => false do |t|
      t.string :genre_id
      t.string :song_id
    end
  end
end
