 class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |column|
      column.string :name
    end
  end
end
