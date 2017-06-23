class CreateArtists < ActiveRecord::Migration
def change
    
    create_table :artists do |table|
                              table.text :name
                              table.integer :song_id
                          end


end
end
