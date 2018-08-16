class ChangeArtistSpellingError < ActiveRecord::Migration
  def change
    rename_column :songs, :atritst_id, :artist_id
  end
end
