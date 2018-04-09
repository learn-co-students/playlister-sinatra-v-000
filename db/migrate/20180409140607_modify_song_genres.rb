class ModifySongGenres < ActiveRecord::Migration[5.1]
  def change
    add_column :song_genres, :genre_id, :integer
    remove_column :song_genres, :genre_ids
  end
end
