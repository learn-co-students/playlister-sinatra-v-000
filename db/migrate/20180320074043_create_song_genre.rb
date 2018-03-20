class CreateSongGenre < ActiveRecord::Migration[5.1]
  def change
    create_table :songs_genres, index: false do |t|
      t.belongs_to :song
      t.belongs_to :genre
    end
  end
end
