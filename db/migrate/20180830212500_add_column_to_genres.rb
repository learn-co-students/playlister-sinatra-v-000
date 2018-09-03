class AddColumnToGenres < ActiveRecord::Migration
  def change
    add_column :song_genres, :genre_id, :integer 
  end
end
