class RemoveGenreIdsFromSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.remove :genre_ids
    end

  end
end
