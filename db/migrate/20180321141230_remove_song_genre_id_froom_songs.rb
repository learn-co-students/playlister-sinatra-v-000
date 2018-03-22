class RemoveSongGenreIdFroomSongs < ActiveRecord::Migration[5.1]
  def change
    change_table :songs do |t|
      t.remove :song_genre_id
  end
end
end
