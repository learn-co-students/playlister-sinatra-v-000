class CreateSongs < ActiveRecord::Migration[4.2]
  def change
    create_table :songs do |song|
      song.string :name
    end
  end
end   
