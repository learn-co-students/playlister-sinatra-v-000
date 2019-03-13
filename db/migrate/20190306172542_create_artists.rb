class CreateArtists < ActiveRecord::Migration
  #made with rake db:create_migration NAME=create_artists
  def change
    create_table :artists do |t|
      t.string :name
      #t.string :songs not needed 
      #t.string :genres
      #t.string :song_id
      #t.string :genre_id
    end
  end
end
