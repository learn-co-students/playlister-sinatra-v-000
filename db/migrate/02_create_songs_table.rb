class CreateSongsTable < ActiveRecord::Migration[4.2]
  create_table :songs do |t|
    t.string :name
    t.string :artist
  end
end
