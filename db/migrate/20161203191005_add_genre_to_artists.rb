class AddGenreToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :genre, :text
  end
end
