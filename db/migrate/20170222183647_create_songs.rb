class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |column|
      column.string :name
      column.integer :artist_id
    end
  end
end
