class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |table|
      table.string :name 
    end
  end
end
