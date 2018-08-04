class CreateSonggenres < ActiveRecord::Migration
  def change
    create_table :songgenres do |s|
      s.integer :song_id
      s.integer :genre_id 
    end
  end
end
