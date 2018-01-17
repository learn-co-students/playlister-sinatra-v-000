class CreateSongs < ActiveRecord::Migration
  def up
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end   
  end

  def down
    drop_table :songs
  end
end
