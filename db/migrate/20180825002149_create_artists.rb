class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |a|
      a.string :name
    end
  end
end
