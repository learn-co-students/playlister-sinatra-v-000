class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |a|
      a.string :name
      a.integer :artist_id
    end
  end
end
