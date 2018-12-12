class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres |t| do
      t.string :name
    end
  end
end
