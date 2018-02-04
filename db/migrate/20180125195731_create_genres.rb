class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |col|
      col.string :name
      col.integer :artist_id
      col.integer :song_id
    end
  end
end
