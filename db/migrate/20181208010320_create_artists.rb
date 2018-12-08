class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |a|
      a.string :name
      a.string :songs
      a.string :genres
    end
  end
end
