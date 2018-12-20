class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |artist|
      artist.string :name
    end
  end
end
