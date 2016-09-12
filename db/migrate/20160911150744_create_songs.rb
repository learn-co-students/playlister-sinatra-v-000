class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    t.string :name 
    t.integer :artist_id
    # t.integer :genre_id      #do i need this?
    end
  end
end
