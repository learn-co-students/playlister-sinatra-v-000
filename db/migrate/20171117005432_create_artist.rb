class CreateArtist < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genres
      t.timestamps null: false
    end
  end
end
