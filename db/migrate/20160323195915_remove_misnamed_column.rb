class RemoveMisnamedColumn < ActiveRecord::Migration
  def change
    remove_column :songs, :arist_id
  end
end
