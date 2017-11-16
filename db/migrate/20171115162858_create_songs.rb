class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.integer :genre_id
      t.string :slug
    end
  end
end
