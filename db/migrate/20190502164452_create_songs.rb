class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    t.string :name
  end
end
