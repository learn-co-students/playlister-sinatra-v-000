class RenameGenreNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :genre_name, :name
  end
end
