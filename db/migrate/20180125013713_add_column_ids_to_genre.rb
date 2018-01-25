class AddColumnIdsToGenre < ActiveRecord::Migration
  def change
    add_column :genres, :artist_id, :integer
    add_column :genres, :song_id, :integer
  end
end
