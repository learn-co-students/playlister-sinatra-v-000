class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |song|
      song.string :name
      song.integer :artist_id
    end
  end
end
