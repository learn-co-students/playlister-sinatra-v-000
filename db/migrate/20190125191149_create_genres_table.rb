class CreateGenresTable < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.string :slug
    end
  end
end
