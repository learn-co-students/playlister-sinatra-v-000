class CreateSongs < ActiveRecord::Migration
def change

    create_table :songs do |table|
                             table.string :name
                       
                       

    end
    


end
end
