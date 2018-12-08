class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |s|
      s.string :name
      s.string :artist
      s.string :genres
    end
  end
end
