class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
  #    t.string :song_ids
  #    t.string :genre_ids
    end
  end
end
