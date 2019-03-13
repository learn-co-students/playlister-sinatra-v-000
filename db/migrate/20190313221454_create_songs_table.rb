class CreateSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
     t.string :name
     t.string :artist
     t.integer :artist_id
   end
  end
end
