class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.belongs_to :artst, index: true
    end
  end
end
