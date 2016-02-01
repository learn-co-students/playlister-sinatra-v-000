class RemoveColumnSongFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :song
  end
end
