class AddSongsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :song, :text
  end
end
