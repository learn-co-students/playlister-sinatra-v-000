class RemoveSongColumnFromGenre < ActiveRecord::Migration[5.1]
  def change
    remove_column :genres, :song
  end
end
