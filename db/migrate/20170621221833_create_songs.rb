class CreateSongs < ActiveRecord::Migration
def change

    create_table :songs do |table|
                             table.text :name
                             table.integer :artist_id

    end
    


end
end
