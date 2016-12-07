

class CreateSong < ActiveRecord::Migration
  def change
     create_table :songs do |t|
      t.text :name
      t.integer :artist_id
      end
  end
end
