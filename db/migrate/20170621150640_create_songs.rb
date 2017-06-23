class CreateSongs < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :genres do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.timestamps null: false
    end

    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
      t.timestamps null: false
    end

  end
end
