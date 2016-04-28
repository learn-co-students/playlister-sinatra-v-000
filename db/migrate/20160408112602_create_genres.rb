class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |g|
      g.string :name
    end
  end
end
