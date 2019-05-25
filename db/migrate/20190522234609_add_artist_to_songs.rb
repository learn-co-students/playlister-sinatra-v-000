class AddArtistToSongs < ActiveRecord::Migration[5.2]
  def change
    # this is needed to pass rspec 01_artist_spec
    # add_column :table, :thing_to_be_added, :thing's type
    add_column :songs, :artist_id, :integer
  end
end