class CreateGenres < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end
  end
end
