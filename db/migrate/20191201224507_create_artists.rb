class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |artist|
    artist.string :name
  end
end
end
