class ChangeSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.remove :user_id
    end
  end
end
