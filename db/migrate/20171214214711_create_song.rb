class CreateSong < ActiveRecord::Migration
  def change
    create_table :song do |t|
      t.string :name
    end
  end
end
