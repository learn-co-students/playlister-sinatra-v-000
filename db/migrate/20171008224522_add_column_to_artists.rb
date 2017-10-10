class AddColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :songs, :string
  end
end
