class Artists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :slug
    end


    create_table :songs do |t|
      t.integer :artist_id #fk
      t.string :name
    end

    create_table :genres do |t|
      t.string :name
    end

    create_table :song_genres do |t|
      t.integer :song_id #fk
      t.integer :genre_id #fk
    end

  end
end
