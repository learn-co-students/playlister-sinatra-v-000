class ChangeColumnSongGenre < ActiveRecord::Migration
  def change
    remove_column :song_genres, :genre_ids, :integer
    add_column :song_genres, :genre_id, :integer
  end
end
