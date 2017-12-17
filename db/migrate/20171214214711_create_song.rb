class CreateSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.index :artist_id
    end
  end
end
