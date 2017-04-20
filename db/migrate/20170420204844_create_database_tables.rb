class CreateDatabaseTables < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
    end

    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end

    create_table :genres do |t|
    end

    create_table :song_genres do |t|
    end
  end
end
