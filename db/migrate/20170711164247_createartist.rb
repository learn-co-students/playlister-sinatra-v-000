class Createartist < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :song
      t.string :genre
      t.string :genre_id

      end
  end
end
