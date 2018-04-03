class CreateSongsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :genre
      t.string :something
      t.string :artist_id
    end
  end
end
