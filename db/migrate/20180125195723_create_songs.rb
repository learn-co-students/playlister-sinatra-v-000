class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |col|
      col.string :name
      col.integer :artist_id
      col.integer :genre_id
    end
  end
end
