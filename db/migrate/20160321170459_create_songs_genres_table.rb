class CreateSongsGenresTable < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_idrak
    end
  end
end
