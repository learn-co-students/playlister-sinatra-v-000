class RemoveSongIdFromGenresTable < ActiveRecord::Migration
  def change
    remove_column(:genres, :song_id)
  end
end
