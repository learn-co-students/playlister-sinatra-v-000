class AddGenereIdToSongs < ActiveRecord::Migration
    def self.up
      add_column :songs, :genre_id, :integer
    end
end
