class CreateSongs < ActiveRecord::Migration
    def up
        create_table :songs do |t|
            t.string :name
            t.string :artist
        end
    end

    def down
        drop_table :songs
    end
end
