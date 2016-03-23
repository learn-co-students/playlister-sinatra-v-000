class UpdateSongsColumns < ActiveRecord::Migration
  def change
    remove_column :songs, :genre_ids
    add_column :songs, :genre_id, :integer
  end
end
