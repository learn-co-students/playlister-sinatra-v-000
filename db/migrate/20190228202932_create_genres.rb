class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |table|
      table.string :name 
    end
  end
end
