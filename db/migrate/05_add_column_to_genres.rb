class AddColumnToGenres < ActiveRecord::Migration
  
  def change
    add_column :genres, :song_id, :integer
  end
  
end