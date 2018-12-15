class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |genre|
      genre.string :name
    end
  end
end
