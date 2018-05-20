class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |s|
      s.string :name
      s.integer :artist_id
    end
  end
end
