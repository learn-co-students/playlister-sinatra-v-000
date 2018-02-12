class CreateArtists < ActiveRecord::Migration[4.2]

  def change
    create_table :artists do |t|
      t.string :name
      t.string :slug
      #t.integer :song_id
      #t.integer :genre_id
    end
  end

end
