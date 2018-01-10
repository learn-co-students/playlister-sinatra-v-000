class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |s|
      s.string :name
      s.integer :artist_id   # a song belongs to a single artist
    end
  end
end
