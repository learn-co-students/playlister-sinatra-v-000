class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |a|
      a.string :name
    end
  end
end
