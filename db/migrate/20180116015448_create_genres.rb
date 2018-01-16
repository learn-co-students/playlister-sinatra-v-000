class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :name
    end
    add_reference :artists, :genre
  end
end
