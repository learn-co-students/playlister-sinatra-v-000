class RemoveArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :song_id, :integer
    remove_column :artists, :genre_id, :integer
  end
end
