class RemoveSongsTable < ActiveRecord::Migration
  def change
    remove_column :songs, :genre_id, :integer
  end
end
