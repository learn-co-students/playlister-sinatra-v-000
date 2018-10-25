class CreateRenameArtistGenreColumn < ActiveRecord::Migration
  def change
    rename_column :artist_genres, :song_id, :genre_id
  end
end
