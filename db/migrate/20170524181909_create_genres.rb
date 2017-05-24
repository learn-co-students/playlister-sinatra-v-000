class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |x|
      x.string :name
    end
  end
end
