class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |s|
      s.string :name
    end
  end
end
