class CreateGenre < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.text :name
      t.text :song
    end
  end
end
