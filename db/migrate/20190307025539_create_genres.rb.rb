class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |i|
      i.string :name
    end
  end
end