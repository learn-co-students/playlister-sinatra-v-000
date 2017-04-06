class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.timestamps
    end
  end
end
