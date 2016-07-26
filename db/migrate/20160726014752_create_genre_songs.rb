class CreateGenreSongs < ActiveRecord::Migration
  def change
    create_table :song_genres, id: false do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :song, index: true
    end
  end
end
