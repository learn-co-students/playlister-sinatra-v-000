class AddSongsArtist < ActiveRecord::Migration
  def change
      add_column :songs, :artist, :integer
  end
end
