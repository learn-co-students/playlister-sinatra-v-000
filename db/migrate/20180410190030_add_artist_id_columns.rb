class AddArtistIdColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :artist_id, :integer
    add_column :genres, :artist_id, :integer

  end
end
