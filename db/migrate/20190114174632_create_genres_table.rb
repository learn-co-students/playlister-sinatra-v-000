class CreateGenresTable < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :song_id 
      t.integer :artist_id
    end
  end
end