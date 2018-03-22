class RemoveSongGenreIdFromGenres < ActiveRecord::Migration[5.1]
  def change
    change_table :genres do |t|
      t.remove :song_genre_id
  end
end
end
