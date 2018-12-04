class AddGenreIdColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :songs, :genre_id, :integer
  end
end
