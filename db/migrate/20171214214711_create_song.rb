class CreateSong < ActiveRecord::Migration
  def change
    create_table :song |t| do
      t.string :name
    end
  end
end
