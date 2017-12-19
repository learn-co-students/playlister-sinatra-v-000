class RemoveSongidGenres < ActiveRecord::Migration
  def up
    remove_column :genres, :song_id
  end

  def down
    add_column :genres, :song_id, :integer
  end
end
