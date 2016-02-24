class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string  :name
      

      t.timestamp null: false
    end
  end
end
