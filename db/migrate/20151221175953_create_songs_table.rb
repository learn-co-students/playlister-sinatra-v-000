class CreateSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :name
      t.integer :artist_id
      t.timestamp null: false
    end
  end
end
