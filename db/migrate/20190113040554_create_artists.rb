class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |c|
      c.string :name
    end
  end
end
