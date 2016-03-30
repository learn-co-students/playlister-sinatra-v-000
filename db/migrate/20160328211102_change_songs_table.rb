class ChangeSongsTable < ActiveRecord::Migration
  def change
    remove_column :songs, :artist
    add_column :songs, :artist_id, :integer
  end
end

