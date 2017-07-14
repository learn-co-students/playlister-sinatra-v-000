class Createartist < ActiveRecord::Migration[4.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :song
      t.string :genre
      t.string :genre_id

      end
  end
end
