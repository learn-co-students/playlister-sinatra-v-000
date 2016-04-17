class Createartistsandgenres < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
    end

    create_table :genres do |t|
      t.string :name
    end
  end
end
