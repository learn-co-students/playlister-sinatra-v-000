class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |s|
      s.string :name
    end
  end
end
