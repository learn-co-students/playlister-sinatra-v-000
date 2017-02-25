class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.timestamp null: false
    end
  end

  def down
    drop_table :artist
  end
end
