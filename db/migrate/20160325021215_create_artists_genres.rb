class CreateArtistsGenres < ActiveRecord::Migration
  def change
    create_table :artists_genres do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :artist, index: true
    end
  end
end
