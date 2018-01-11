class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.string :name
      t.belongs_to :song
      t.belongs_to :genre
    end
  end
end
