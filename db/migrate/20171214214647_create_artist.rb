class CreateArtist < ActiveRecord::Migration
  def change
    create_table :artist |t| do
      t.string :name
    end
  end
end
