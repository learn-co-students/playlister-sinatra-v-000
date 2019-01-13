class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |c|
      c.string :name
    end
  end
end
