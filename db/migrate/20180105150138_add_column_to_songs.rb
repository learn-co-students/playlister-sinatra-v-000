class AddColumnToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :artist_id, :integer
  end
end
