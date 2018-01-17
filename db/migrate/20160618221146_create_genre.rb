class CreateGenre < ActiveRecord::Migration
  def change
  	create_table :genres do |t|
  		t.string :name
  		t.string :artist_id
  	end
  end
end
