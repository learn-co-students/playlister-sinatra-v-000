class DropColumnsFromGenresTable < ActiveRecord::Migration[4.2]
 def change
   remove_column :genres, :artist
   remove_column :genres, :song
 end
end
