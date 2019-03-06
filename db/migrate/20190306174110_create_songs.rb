class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :genres
      t.string :artists
      t.integer :song_id
    end
  end
end
