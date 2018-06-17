class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      # t.integer :song_id
      # t.integer :artist_id
      #a genre does not belong to a song nor an artist so you do not need the above code
    end
  end
end
