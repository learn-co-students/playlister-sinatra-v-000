class AddGenresToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :genres, :string
  end
end
