class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.references :artist, foreign_key: true
      t.timestamp null: false
    end
  end

  def down
    drop_table :songs
  end
end
