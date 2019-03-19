class RenameSlugColumnGenre < ActiveRecord::Migration[5.2]
  def change
    rename_column :artists, :slug, :genre
  end
end
