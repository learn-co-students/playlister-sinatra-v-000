class Migration < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
    end
    
    create_table :genres do |t|
      t.string :name
    end
    
    create_table :artists do |t|
      t.string :name
    end
    
    add_column :songs, :artist_id, :integer
        
        create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end    
  end
end
