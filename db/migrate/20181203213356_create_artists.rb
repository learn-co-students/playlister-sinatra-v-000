class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |i|
      i.string :name
    end
  end
end
