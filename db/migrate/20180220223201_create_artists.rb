class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.text :name
    end
  end
end
