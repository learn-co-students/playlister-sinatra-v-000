class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs |t| do
      t.string :name
      t.integer :artist_id
    end
  end
end
