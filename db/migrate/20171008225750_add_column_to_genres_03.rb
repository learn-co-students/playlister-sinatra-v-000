class AddColumnToGenres03 < ActiveRecord::Migration
  def change
    add_column :genres, :artist_id, :integer
  end
end
