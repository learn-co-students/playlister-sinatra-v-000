class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre_ids
      t.string :song_ids
    end
  end
end
