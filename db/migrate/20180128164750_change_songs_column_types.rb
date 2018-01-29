class ChangeSongsColumnTypes < ActiveRecord::Migration
  def change
    change_column :songs, :artist_id, :integer
    change_column :songs, :genre_ids, :integer
  end
end
