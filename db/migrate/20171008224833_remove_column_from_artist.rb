class RemoveColumnFromArtist < ActiveRecord::Migration
  def change
    remove_column(:artists, :songs)
  end
end
