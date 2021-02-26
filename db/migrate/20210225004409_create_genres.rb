class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |g|
      g.string :name
      g.integer :song_id
    end
  end
end
