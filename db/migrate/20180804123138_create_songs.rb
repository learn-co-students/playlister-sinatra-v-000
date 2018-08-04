class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |s|
      s.string :name
      s.integer :artist_id
    end
  end
end
