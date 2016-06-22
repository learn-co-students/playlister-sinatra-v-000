class CreateSongGenresTable < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|  #had this as :song_genre - that didn't work either
      # t.belongs_to :song, index: true
      t.integer :song_id
      # t.belongs_to :genre, index: true
      t.integer :genre_id
    end
  end
end
