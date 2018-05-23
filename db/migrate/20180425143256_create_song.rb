class CreateSong < ActiveRecord::Migration[5.1]
  def change
        create_table :songs do |t|
      t.integer  :artist_id
      t.string   :name
  end
  end
end
