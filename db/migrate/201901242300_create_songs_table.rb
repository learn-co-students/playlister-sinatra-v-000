class CreateSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :slug
      t.string :artist
      t.string :genre
    end
  end
end