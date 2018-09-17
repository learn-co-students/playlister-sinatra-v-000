class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :songs
      t.string :genres
      t.string :slug
    end
  end
end
