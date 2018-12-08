class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |g|
      g.string :name
      # g.string :songs
      # g.string :artist_id
    end
  end
end
