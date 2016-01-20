class CreateArtistsTable < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.text :name
      t.timestamp null: false
    end
  end
end
