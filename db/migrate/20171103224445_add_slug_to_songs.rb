class AddSlugToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :slug, :string
  end
end
