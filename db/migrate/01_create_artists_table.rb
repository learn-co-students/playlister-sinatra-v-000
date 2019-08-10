class CreateArtistsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :genre_id 
    end
  end
end