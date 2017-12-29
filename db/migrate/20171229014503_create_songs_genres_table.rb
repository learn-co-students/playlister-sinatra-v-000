class CreateSongsGenresTable < ActiveRecord::Migration
  def change
    create_table :songs_genres do |t|
      t.string :name
      t.integer :genre_ids
    end
  end
end
