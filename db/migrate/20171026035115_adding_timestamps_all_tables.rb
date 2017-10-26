class AddingTimestampsAllTables < ActiveRecord::Migration
  def change
    add_timestamps :artists, null: true
    add_timestamps :songs, null: true
    add_timestamps :genres, null: true
  end
end
