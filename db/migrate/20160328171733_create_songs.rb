class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      # t.integer :genre_id
      t.integer :artist_id
    end
  end
end
