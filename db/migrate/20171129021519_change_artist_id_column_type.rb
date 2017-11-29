class ChangeArtistIdColumnType < ActiveRecord::Migration
  def change
    change_column :songs, :artist_id, :integer
  end
end
