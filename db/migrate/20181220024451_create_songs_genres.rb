class CreateSongsGenres < ActiveRecord::Migration
  def change
    create_table :songs_genres do |t|
      t.integer :songs_id
      t.integer :genres_id
    end
  end
end
