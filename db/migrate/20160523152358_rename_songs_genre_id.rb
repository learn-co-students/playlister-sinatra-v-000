class RenameSongsGenreId < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.rename :genre_id, :genre_ids
    end
  end
end
