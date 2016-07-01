class DeleteArtistColumn < ActiveRecord::Migration
  def up
    remove_column :songs, :artist 
    
  end

  def down
  end
end