class AddColumnSongGenre < ActiveRecord::Migration
  def change
    add_column :song_genres, :song_id, :integer
  end
end
