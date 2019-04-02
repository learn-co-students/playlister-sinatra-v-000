class AddColumnToArtistsTable < ActiveRecord::Migration[4.2]
    def change
     add_column :artists, :genre_id, :integer
   end
end
