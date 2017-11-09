class RemoveColArtist < ActiveRecord::Migration
  def change
    remove_column :artists, :genre_id
  end
end
