class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :name
      t.integer :artist_id
      t.string :genre
    end
  end
end
