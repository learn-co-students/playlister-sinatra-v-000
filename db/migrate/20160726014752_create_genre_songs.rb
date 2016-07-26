class CreateGenreSongs < ActiveRecord::Migration
  def change
    create_table :genres_songs, id: false do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :song, index: true
    end
  end
end
