class CreateSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.timestamp null:false
    end
  end
end
