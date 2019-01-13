class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |c|
      c.string :name
      c.integer :artist_id
    end
  end
end
