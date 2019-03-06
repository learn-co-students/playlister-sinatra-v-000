class CreateArtists < ActiveRecord::Migration
  #made with rake db:create_migration NAME=create_artists
  def change
    create_table :artists do |t|
      t.string :name
      t.string :songs
      t.string :genres
    end
  end
end
