class Change < ActiveRecord::Migration
  def change
    add_column :artists, :genre_id, :integer
    add_column :genres, :artist_id, :integer
  end
end
