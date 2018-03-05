class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :songs, :artist, :text
  end
end
