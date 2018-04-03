class RenameGenreToGenres < ActiveRecord::Migration[5.1]
  def change
    rename_table :genre, :genres
  end
end
