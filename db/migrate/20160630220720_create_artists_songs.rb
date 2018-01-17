class CreateArtistsSongs < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :songs do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :genres do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
