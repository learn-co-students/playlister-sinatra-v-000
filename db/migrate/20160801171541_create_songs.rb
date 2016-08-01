class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :artist_id
    end
  end
end
