class CreateGenre < ActiveRecord::Migration
  def change
    create_table :genre |t| do
      t.string :name
    end
  end
end
