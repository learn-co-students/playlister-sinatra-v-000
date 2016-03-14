class CreateArtistsGenresSongs < ActiveRecord::Migration
  def change
    create_table :artists do |a|
      a.string :name
      a.timestamps null: false
    end

    create_table :genres do |g|
      g.string :name
      g.timestamps null: false
    end

    create_table :songs do |s|
      s.string :name
      s.integer :artist_id
    end
  end
end
