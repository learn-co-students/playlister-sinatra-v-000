class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :songs, :artists_id, :artist_id
  end
end
