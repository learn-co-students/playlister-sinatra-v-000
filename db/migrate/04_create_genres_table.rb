class CreateGenresTable < ActiveRecord::Migration[4.2]
  create_table :genres do |t|
    t.string :name
    t.string :artist
    t.string :song
  end
end
