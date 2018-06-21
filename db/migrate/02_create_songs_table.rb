class CreateSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |s|
      s.string :name
      s.string :genre
      s.integer :artist_id
    end
  end
end