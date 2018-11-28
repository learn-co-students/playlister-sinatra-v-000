class CreateSongsgenres < ActiveRecord::Migration

  def change
    create_table :songs_genres do |t|
      t.integer :genre_id
      t.integer :song_id
    end
  end

end
