class Removecolumngenreidfromartist < ActiveRecord::Migration
  def change
    remove_column :artists, :genre_ids
  end
end
