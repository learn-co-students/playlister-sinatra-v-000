class RemovgenreFromSongs < ActiveRecord::Migration
  def change
    def change
       remove_column :songs, :genre_id, :integer
    end
  end
end
