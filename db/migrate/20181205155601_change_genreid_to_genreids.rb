class ChangeGenreidToGenreids < ActiveRecord::Migration[5.1]
  def change
  	rename_column :songs, :genre_id, :genre_ids
  end
end
