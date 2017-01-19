class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :songs
      t.string :genres
    end
  end
end

#Unsure if attributes should be in table or model or both 
