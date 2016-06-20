class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |x|
      x.string :name
    end
  end
end
