class CreateSongs < ActiveRecord::Migration
  def up
    create_table :songs do |t|
      t.string :name
    end

    def down
      drop_table :songs
    end
  end
end
