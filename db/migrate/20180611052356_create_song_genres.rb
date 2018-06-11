class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres, id: false do |t|
      t.belongs_to :song
      t.belongs_to :genre
    end
  end
end
