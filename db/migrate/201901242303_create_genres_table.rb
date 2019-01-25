class CreateGenresTable < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.string :slug
      t.string :artist
      t.string :song
    end
  end
end