class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.string :songs
      t.string :artists
      t.integer :genre_id
    end
  end
end
