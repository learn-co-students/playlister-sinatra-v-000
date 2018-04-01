class DropGenreidColumn < ActiveRecord::Migration[5.1]
  def change
     remove_column :songs, :genre_id
  end
end
