class CreateGenresTable < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.text :name
      t.timestamp null: false
    end
  end
end
