class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |song|
      song.string :name
    end
  end
end
