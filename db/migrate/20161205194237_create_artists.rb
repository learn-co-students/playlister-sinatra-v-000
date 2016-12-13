class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artist do |t|
      t.string :name
    end
  end
end
