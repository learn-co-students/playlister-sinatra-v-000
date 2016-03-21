class AddGenresToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_genres, :integer
    add_column :songs, :genres, :string
  end
end
