class CreateSongs < ActiveRecord::Migration[4.2]
  def change
    create_table :songs do |t|
    t.integer :artist_id
    t.timestamps null: false
    end
  end
end
