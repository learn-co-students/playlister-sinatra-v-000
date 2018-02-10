class CreateGenres < ActiveRecord::Migration[4.2]

  def change
    create_table :genres do |t|
      t.string :name
      t.string :slug
      # t.integer :artist_id
      # t.integer :song_id
      # t.integer :join_id
    end
  end

end
