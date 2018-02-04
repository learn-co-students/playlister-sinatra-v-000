class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do | col |
      col.string :name
      col.integer :genre_id
    end
  end
end
