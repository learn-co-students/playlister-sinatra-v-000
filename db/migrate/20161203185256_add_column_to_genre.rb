class AddColumnToGenre < ActiveRecord::Migration
  def change
    add_column :genres, :artist, :text
  end
end
