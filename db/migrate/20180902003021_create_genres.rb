class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :song_id
      t.integer :song_genre_id
    end
  end
end
