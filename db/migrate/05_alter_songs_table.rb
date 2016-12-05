class AlterSongsTable < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.integer :artist_id
    end
  end
end
