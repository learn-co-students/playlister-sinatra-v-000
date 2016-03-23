class RevertSongsColumns < ActiveRecord::Migration
  def change
    add_column :songs, :genre_ids, :integer
    remove_column :songs, :genre_id
  end
end
