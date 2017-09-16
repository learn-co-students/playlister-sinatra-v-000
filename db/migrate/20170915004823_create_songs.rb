class CreateSongs < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
    end
  end
end
