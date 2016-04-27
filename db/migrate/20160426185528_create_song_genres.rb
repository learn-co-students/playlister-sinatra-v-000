class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      # t.belongs_to :song, index: true
      # t.belongs_to :genre, index: true
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
