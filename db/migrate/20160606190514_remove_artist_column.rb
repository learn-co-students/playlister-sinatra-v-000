class RemoveArtistColumn < ActiveRecord::Migration
  def change
    remove_column :songs, :artist, :string
  end
end
