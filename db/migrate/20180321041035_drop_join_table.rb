class DropJoinTable < ActiveRecord::Migration[5.1]
    def change
        drop_table :song_genres
    end
end
