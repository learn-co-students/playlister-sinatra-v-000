class Creategenres < ActiveRecord::Migration[4.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :song
      t.string :artist
      t.integer :song_id
      end
  end
end
