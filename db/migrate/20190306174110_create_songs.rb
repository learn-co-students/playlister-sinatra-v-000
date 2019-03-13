class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      #t.string :genres
      #t.string :artists
      t.integer :artist_id #belongs_to so required
      #t.integer :genre_id
    end
  end
end
