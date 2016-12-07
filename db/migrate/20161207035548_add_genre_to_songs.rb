class AddGenreToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :genres, :text
  end
end
